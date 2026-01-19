import 'package:dartz/dartz.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/user_preferences/models/user_preferences.dart';

abstract class UserPreferencesService {
  // Track user interactions with enhanced metadata
  Future<Either<MainFailure, Unit>> trackInteraction({
    required String entityId,
    required InteractionType type,
    int weight = 1,
    String profileName = 'default',
    String? title,
    String? channelName,
    String? category,
    List<String> tags = const [],
  });

  // Get user's top topics/interests
  Future<Either<MainFailure, List<UserTopicPreference>>> getTopTopics({
    required String profileName,
    int limit = 10,
  });

  // Get recommended search queries based on user history
  Future<Either<MainFailure, List<String>>> getRecommendedQueries({
    required String profileName,
    int limit = 20,
  });

  // Get recent interactions
  Future<Either<MainFailure, List<UserInteraction>>> getRecentInteractions({
    required String profileName,
    InteractionType? type,
    int limit = 50,
  });

  // Update topic preferences based on interactions
  Future<Either<MainFailure, Unit>> updateTopicPreferences({
    required String profileName,
  });

  // Clear old interactions (privacy/cleanup)
  Future<Either<MainFailure, Unit>> clearOldInteractions({
    required String profileName,
    Duration olderThan = const Duration(days: 90),
  });

  // Get recommended channels based on watch history
  Future<Either<MainFailure, List<String>>> getRecommendedChannels({
    required String profileName,
    int limit = 10,
  });
}
