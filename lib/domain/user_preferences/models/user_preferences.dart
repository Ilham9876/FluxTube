// ignore_for_file: public_member_api_docs

//--------USER PREFERENCES MODELS--------//
// Domain models for user interactions and topic preferences

/// Tracks user interactions for personalized recommendations
class UserInteraction {
  late String entityId; // video ID, channel ID, or search query
  late InteractionType type;
  late DateTime timestamp;
  late int weight; // Higher weight = more important (watch time, recent searches, etc.)
  String profileName;

  // Enhanced metadata for better recommendations
  String? title; // Video title for keyword extraction
  String? channelName; // Channel name for channel-based recommendations
  String? category; // Video category if available
  List<String> tags; // Tags extracted from title/description

  UserInteraction({
    required this.entityId,
    required this.type,
    required this.timestamp,
    this.weight = 1,
    this.profileName = 'default',
    this.title,
    this.channelName,
    this.category,
    this.tags = const [],
  });
}

enum InteractionType {
  videoWatch,
  videoSave,
  search,
  channelView,
  videoComplete, // Watched >80% of video
}

/// Stores extracted keywords/topics from user interactions
class UserTopicPreference {
  late String topic; // Extracted keyword or category
  late double relevanceScore; // How relevant is this topic (0.0 - 1.0)
  late DateTime lastUpdated;
  String profileName;

  UserTopicPreference({
    required this.topic,
    required this.relevanceScore,
    required this.lastUpdated,
    this.profileName = 'default',
  });
}

/// Trending/default topics for new users
class DefaultTopic {
  final String keyword;
  final int priority;

  const DefaultTopic(this.keyword, this.priority);

  static const defaultTopics = [
    DefaultTopic('music', 10),
    DefaultTopic('gaming', 9),
    DefaultTopic('technology', 8),
    DefaultTopic('entertainment', 7),
    DefaultTopic('tutorial', 6),
    DefaultTopic('news', 5),
    DefaultTopic('sports', 4),
    DefaultTopic('cooking', 3),
    DefaultTopic('travel', 2),
    DefaultTopic('science', 1),
  ];
}
