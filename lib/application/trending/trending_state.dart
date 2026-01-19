part of 'trending_bloc.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState({
    required String lastUsedRegion,

    // PIPED
    required List<TrendingResp> trendingResult,
    required List<TrendingResp> feedResult,
    required ApiStatus fetchTrendingStatus,
    required ApiStatus fetchFeedStatus,

    // INVIDIOUS

    required ApiStatus fetchInvidiousTrendingStatus,
    required List<InvidiousTrendingResp> invidiousTrendingResult,

    // NEWPIPE

    required ApiStatus fetchNewPipeTrendingStatus,
    required List<NewPipeTrendingResp> newPipeTrendingResult,
    required ApiStatus fetchNewPipeFeedStatus,
    required List<NewPipeTrendingResp> newPipeFeedResult,

    // PERSONALIZED RECOMMENDATIONS
    required ApiStatus fetchPersonalizedFeedStatus,
    required List<dynamic>
        personalizedFeedResult, // Can be NewPipeSearchItem, TrendingResp, etc.
    required bool hasMorePersonalizedContent,
    required int personalizedFeedQueryOffset,

    // CACHE TIMESTAMPS - track when data was last fetched
    DateTime? trendingLastFetched,
    DateTime? feedLastFetched,
    DateTime? newPipeTrendingLastFetched,
    DateTime? newPipeFeedLastFetched,
    DateTime? invidiousTrendingLastFetched,
    DateTime? personalizedFeedLastFetched,

    // Pagination state for infinite scroll
    // How many items to display (increments as user scrolls)
    required int feedDisplayCount,
    required int trendingDisplayCount,
    required int newPipeFeedDisplayCount,
    required int newPipeTrendingDisplayCount,
    required int invidiousTrendingDisplayCount,
    required int personalizedFeedDisplayCount,
    // Loading state for "load more"
    required bool isLoadingMoreFeed,
    required bool isLoadingMoreTrending,
    required bool isLoadingMoreNewPipeFeed,
    required bool isLoadingMoreNewPipeTrending,
    required bool isLoadingMoreInvidiousTrending,
    required bool isLoadingMorePersonalizedFeed,
  }) = _Initial;

  factory TrendingState.initialize() => const TrendingState(
        lastUsedRegion: 'IN',

        // PIPED

        trendingResult: [],
        feedResult: [],
        fetchTrendingStatus: ApiStatus.initial,
        fetchFeedStatus: ApiStatus.initial,

        // INVIDIOUS

        fetchInvidiousTrendingStatus: ApiStatus.initial,
        invidiousTrendingResult: [],

        // NEWPIPE

        fetchNewPipeTrendingStatus: ApiStatus.initial,
        newPipeTrendingResult: [],
        fetchNewPipeFeedStatus: ApiStatus.initial,
        newPipeFeedResult: [],

        // PERSONALIZED

        fetchPersonalizedFeedStatus: ApiStatus.initial,
        personalizedFeedResult: [],
        hasMorePersonalizedContent: true,
        personalizedFeedQueryOffset: 0,

        // CACHE - null means never fetched
        trendingLastFetched: null,
        feedLastFetched: null,
        newPipeTrendingLastFetched: null,
        newPipeFeedLastFetched: null,
        invidiousTrendingLastFetched: null,
        personalizedFeedLastFetched: null,

        // Pagination - initially show 2 items for personalized, 10 for others
        feedDisplayCount: 10,
        trendingDisplayCount: 10,
        newPipeFeedDisplayCount: 10,
        newPipeTrendingDisplayCount: 10,
        invidiousTrendingDisplayCount: 10,
        personalizedFeedDisplayCount: 2,
        isLoadingMoreFeed: false,
        isLoadingMoreTrending: false,
        isLoadingMoreNewPipeFeed: false,
        isLoadingMoreNewPipeTrending: false,
        isLoadingMoreInvidiousTrending: false,
        isLoadingMorePersonalizedFeed: false,
      );
}

/// Helper extension for cache validity checking
extension TrendingStateCache on TrendingState {
  /// Cache duration for different data types
  static const Duration trendingCacheDuration = Duration(minutes: 15);
  static const Duration feedCacheDuration = Duration(minutes: 10);
  static const Duration personalizedCacheDuration = Duration(minutes: 30);

  /// Check if trending data is still valid (not expired)
  bool get isTrendingCacheValid {
    if (trendingLastFetched == null) return false;
    return DateTime.now().difference(trendingLastFetched!) < trendingCacheDuration;
  }

  /// Check if feed data is still valid
  bool get isFeedCacheValid {
    if (feedLastFetched == null) return false;
    return DateTime.now().difference(feedLastFetched!) < feedCacheDuration;
  }

  /// Check if NewPipe trending data is still valid
  bool get isNewPipeTrendingCacheValid {
    if (newPipeTrendingLastFetched == null) return false;
    return DateTime.now().difference(newPipeTrendingLastFetched!) < trendingCacheDuration;
  }

  /// Check if NewPipe feed data is still valid
  bool get isNewPipeFeedCacheValid {
    if (newPipeFeedLastFetched == null) return false;
    return DateTime.now().difference(newPipeFeedLastFetched!) < feedCacheDuration;
  }

  /// Check if Invidious trending data is still valid
  bool get isInvidiousTrendingCacheValid {
    if (invidiousTrendingLastFetched == null) return false;
    return DateTime.now().difference(invidiousTrendingLastFetched!) < trendingCacheDuration;
  }

  /// Check if personalized feed data is still valid
  bool get isPersonalizedFeedCacheValid {
    if (personalizedFeedLastFetched == null) return false;
    return DateTime.now().difference(personalizedFeedLastFetched!) < personalizedCacheDuration;
  }
}
