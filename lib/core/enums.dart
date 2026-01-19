enum YouTubeServices {
  newpipe, // Primary service - direct extraction via NewPipe Extractor (Android only)
  piped,
  explode,
  invidious,
}

enum ApiStatus {
  initial,
  loading,
  loaded,
  error,
}

/// Home feed display mode
enum HomeFeedMode {
  /// Show subscription feed if available, otherwise trending
  feedOrTrending,
  /// Always show subscription feed only (empty if no subscriptions)
  feedOnly,
  /// Always show trending videos only
  trendingOnly,
}
