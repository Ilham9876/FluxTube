import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/user_preferences/models/user_preferences.dart'
    as domain;
import 'package:fluxtube/domain/user_preferences/user_preferences_service.dart';
import 'package:fluxtube/infrastructure/database/database.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserPreferencesService)
class UserPreferencesImpl implements UserPreferencesService {
  AppDatabase get db => AppDatabase.instance;

  // Stop words to filter out from keyword extraction
  static const _stopWords = {
    'the', 'a', 'an', 'and', 'or', 'but', 'in', 'on', 'at', 'to', 'for',
    'of', 'with', 'by', 'from', 'is', 'are', 'was', 'were', 'be', 'been',
    'being', 'have', 'has', 'had', 'do', 'does', 'did', 'will', 'would',
    'could', 'should', 'may', 'might', 'must', 'this', 'that', 'these',
    'those', 'i', 'you', 'he', 'she', 'it', 'we', 'they', 'what', 'which',
    'who', 'when', 'where', 'why', 'how', 'all', 'each', 'every', 'both',
    'few', 'more', 'most', 'other', 'some', 'such', 'no', 'not', 'only',
    'own', 'same', 'so', 'than', 'too', 'very', 'just', 'also', 'now',
    'new', 'one', 'two', 'first', 'video', 'official', 'full', 'hd',
    '4k', '1080p', '720p', 'episode', 'part', 'ep', 'vs', 'ft', 'feat',
  };

  // Convert Drift UserInteraction to domain
  domain.UserInteraction _interactionToDomain(UserInteraction interaction) {
    return domain.UserInteraction(
      entityId: interaction.entityId,
      type: domain.InteractionType.values[interaction.interactionType],
      timestamp: interaction.timestamp,
      weight: interaction.weight.toInt(),
      profileName: interaction.profileName,
      title: interaction.title,
      channelName: interaction.channelName,
      category: interaction.category,
      tags: interaction.tags != null
          ? (jsonDecode(interaction.tags!) as List).cast<String>()
          : [],
    );
  }

  // Convert Drift UserTopicPreference to domain
  domain.UserTopicPreference _topicToDomain(UserTopicPreference pref) {
    return domain.UserTopicPreference(
      topic: pref.topic,
      relevanceScore: pref.relevanceScore,
      lastUpdated: pref.lastUpdated,
      profileName: pref.profileName,
    );
  }

  @override
  Future<Either<MainFailure, Unit>> trackInteraction({
    required String entityId,
    required domain.InteractionType type,
    int weight = 1,
    String profileName = 'default',
    String? title,
    String? channelName,
    String? category,
    List<String> tags = const [],
  }) async {
    try {
      // Extract tags from title if not provided
      final extractedTags = tags.isNotEmpty ? tags : _extractKeywords(title);

      await db.upsertInteraction(UserInteractionsCompanion.insert(
        entityId: entityId,
        interactionType: type.index,
        profileName: profileName,
        timestamp: DateTime.now(),
        weight: Value(weight.toDouble()),
        title: Value(title),
        channelName: Value(channelName),
        category: Value(category),
        tags: Value(jsonEncode(extractedTags)),
      ));

      // Update topic preferences after certain interactions
      if (type == domain.InteractionType.videoWatch ||
          type == domain.InteractionType.videoComplete ||
          type == domain.InteractionType.search) {
        await updateTopicPreferences(profileName: profileName);
      }

      return const Right(unit);
    } catch (e) {
      log('Error tracking interaction: $e');
      return const Left(MainFailure.clientFailure());
    }
  }

  /// Extract meaningful keywords from a title
  List<String> _extractKeywords(String? text) {
    if (text == null || text.isEmpty) return [];

    // Clean and tokenize
    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), ' ') // Remove punctuation
        .split(RegExp(r'\s+'))
        .where((w) => w.length > 2) // Min 3 chars
        .where((w) => !_stopWords.contains(w)) // Remove stop words
        .where((w) => !RegExp(r'^\d+$').hasMatch(w)) // Remove pure numbers
        .toSet() // Unique
        .toList();

    return words.take(10).toList(); // Limit to 10 keywords
  }

  @override
  Future<Either<MainFailure, List<domain.UserTopicPreference>>> getTopTopics({
    required String profileName,
    int limit = 10,
  }) async {
    try {
      final topics = await db.getTopicPreferences(profileName, limit: limit);
      return Right(topics.map(_topicToDomain).toList());
    } catch (e) {
      log('Error getting top topics: $e');
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<String>>> getRecommendedQueries({
    required String profileName,
    int limit = 20,
  }) async {
    try {
      final queries = <String>[];
      final seen = <String>{};

      // 1. Get recent search interactions (50% of queries)
      final searchLimit = (limit * 0.5).ceil();
      final searchInteractions = await db.getInteractionsByType(
        profileName,
        domain.InteractionType.search.index,
        limit: searchLimit * 2,
      );

      for (final interaction in searchInteractions) {
        if (!seen.contains(interaction.entityId.toLowerCase()) &&
            queries.length < searchLimit) {
          queries.add(interaction.entityId);
          seen.add(interaction.entityId.toLowerCase());
        }
      }

      // 2. Get topic-based queries from watched videos (30% of queries)
      final topicLimit = (limit * 0.3).ceil();
      final topics = await getTopTopics(profileName: profileName, limit: topicLimit * 2);
      topics.fold(
        (l) => null,
        (topicList) {
          for (final topic in topicList) {
            if (queries.length >= searchLimit + topicLimit) break;
            // Skip channel preferences (stored as "channel:name")
            if (topic.topic.startsWith('channel:')) continue;
            if (!seen.contains(topic.topic.toLowerCase())) {
              queries.add(topic.topic);
              seen.add(topic.topic.toLowerCase());
            }
          }
        },
      );

      // 3. Add channel-based queries for variety (10% of queries)
      final channelLimit = (limit * 0.1).ceil();
      topics.fold(
        (l) => null,
        (topicList) {
          int channelCount = 0;
          for (final topic in topicList) {
            if (channelCount >= channelLimit) break;
            if (topic.topic.startsWith('channel:')) {
              final channelName = topic.topic.substring(8); // Remove "channel:" prefix
              if (!seen.contains(channelName)) {
                queries.add(channelName);
                seen.add(channelName);
                channelCount++;
              }
            }
          }
        },
      );

      // 4. Fill remaining with default topics
      if (queries.length < limit) {
        for (final defaultTopic in domain.DefaultTopic.defaultTopics) {
          if (queries.length >= limit) break;
          if (!seen.contains(defaultTopic.keyword.toLowerCase())) {
            queries.add(defaultTopic.keyword);
            seen.add(defaultTopic.keyword.toLowerCase());
          }
        }
      }

      log('[UserPreferences] Generated ${queries.length} recommended queries for $profileName');
      return Right(queries);
    } catch (e) {
      log('Error getting recommended queries: $e');
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<String>>> getRecommendedChannels({
    required String profileName,
    int limit = 10,
  }) async {
    try {
      // Get interactions with channel names
      final interactions = await db.getInteractions(profileName, limit: 100);

      // Count channel occurrences with recency weighting
      final channelScores = <String, double>{};
      final now = DateTime.now();

      for (final interaction in interactions) {
        if (interaction.channelName == null || interaction.channelName!.isEmpty) {
          continue;
        }

        final daysSince = now.difference(interaction.timestamp).inDays;
        final recencyMultiplier = 1.0 / (1 + daysSince / 30.0);

        double typeMultiplier = 1.0;
        if (interaction.interactionType == domain.InteractionType.videoComplete.index) {
          typeMultiplier = 2.0;
        } else if (interaction.interactionType == domain.InteractionType.videoSave.index) {
          typeMultiplier = 1.5;
        }

        final score = recencyMultiplier * typeMultiplier * interaction.weight;
        channelScores[interaction.channelName!] =
            (channelScores[interaction.channelName!] ?? 0.0) + score;
      }

      // Sort by score and return top channels
      final sortedChannels = channelScores.entries.toList()
        ..sort((a, b) => b.value.compareTo(a.value));

      return Right(sortedChannels.take(limit).map((e) => e.key).toList());
    } catch (e) {
      log('Error getting recommended channels: $e');
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, List<domain.UserInteraction>>> getRecentInteractions({
    required String profileName,
    domain.InteractionType? type,
    int limit = 50,
  }) async {
    try {
      List<UserInteraction> interactions;

      if (type != null) {
        interactions = await db.getInteractionsByType(profileName, type.index, limit: limit);
      } else {
        interactions = await db.getInteractions(profileName, limit: limit);
      }

      return Right(interactions.map(_interactionToDomain).toList());
    } catch (e) {
      log('Error getting recent interactions: $e');
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> updateTopicPreferences({
    required String profileName,
  }) async {
    try {
      // Get recent interactions
      final recentInteractions = await db.getInteractions(profileName, limit: 200);

      // Extract topics from all interactions with smart weighting
      final topicScores = <String, double>{};
      final now = DateTime.now();

      for (final interaction in recentInteractions) {
        // Calculate recency multiplier (more recent = higher weight)
        final daysSince = now.difference(interaction.timestamp).inDays;
        final recencyMultiplier = 1.0 / (1 + daysSince / 30.0); // Decay over 30 days

        // Base weight multiplier by interaction type
        double typeMultiplier;
        final interactionType = domain.InteractionType.values[interaction.interactionType];
        switch (interactionType) {
          case domain.InteractionType.videoComplete:
            typeMultiplier = 2.0; // Highest - user watched most of video
          case domain.InteractionType.videoWatch:
            typeMultiplier = 1.0; // Standard
          case domain.InteractionType.videoSave:
            typeMultiplier = 1.5; // User explicitly saved
          case domain.InteractionType.search:
            typeMultiplier = 0.8; // Active interest signal
          case domain.InteractionType.channelView:
            typeMultiplier = 0.5; // Channel exploration
        }

        final baseScore = recencyMultiplier * typeMultiplier * interaction.weight;

        // Extract keywords from search queries
        if (interactionType == domain.InteractionType.search) {
          final keywords = _extractKeywords(interaction.entityId);
          for (final keyword in keywords) {
            topicScores[keyword] = (topicScores[keyword] ?? 0.0) + baseScore;
          }
        }

        // Extract keywords from video title (NEW - this was broken before)
        if (interaction.title != null && interaction.title!.isNotEmpty) {
          final keywords = _extractKeywords(interaction.title);
          for (final keyword in keywords) {
            topicScores[keyword] = (topicScores[keyword] ?? 0.0) + baseScore;
          }
        }

        // Use pre-extracted tags if available (even better - already processed)
        if (interaction.tags != null && interaction.tags!.isNotEmpty) {
          final tags = (jsonDecode(interaction.tags!) as List).cast<String>();
          for (final tag in tags) {
            if (tag.length > 2 && !_stopWords.contains(tag.toLowerCase())) {
              topicScores[tag.toLowerCase()] =
                  (topicScores[tag.toLowerCase()] ?? 0.0) + baseScore * 1.2;
            }
          }
        }

        // Boost channel names as they represent creator preference
        if (interaction.channelName != null && interaction.channelName!.isNotEmpty) {
          final channelKey = 'channel:${interaction.channelName!.toLowerCase()}';
          topicScores[channelKey] =
              (topicScores[channelKey] ?? 0.0) + baseScore * 0.5;
        }
      }

      // Normalize scores
      if (topicScores.isNotEmpty) {
        final maxScore = topicScores.values.reduce((a, b) => a > b ? a : b);
        if (maxScore > 0) {
          topicScores.updateAll((key, value) => value / maxScore);
        }
      }

      // Save top topics
      for (final entry in topicScores.entries) {
        if (entry.value > 0.05) {
          // Lower threshold but filter by score
          await db.upsertTopicPreference(UserTopicPreferencesCompanion.insert(
            topic: entry.key,
            profileName: profileName,
            relevanceScore: Value(entry.value),
            lastUpdated: now,
          ));
        }
      }

      log('[UserPreferences] Updated ${topicScores.length} topic preferences for $profileName');
      return const Right(unit);
    } catch (e) {
      log('Error updating topic preferences: $e');
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, Unit>> clearOldInteractions({
    required String profileName,
    Duration olderThan = const Duration(days: 90),
  }) async {
    try {
      final cutoffDate = DateTime.now().subtract(olderThan);
      await db.deleteOldInteractions(profileName, cutoffDate);
      return const Right(unit);
    } catch (e) {
      log('Error clearing old interactions: $e');
      return const Left(MainFailure.clientFailure());
    }
  }
}
