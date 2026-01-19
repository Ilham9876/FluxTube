part of 'trending_bloc.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  const factory TrendingEvent.getTrendingData(
      {required String serviceType, required String region}) = GetTrendingData;
  const factory TrendingEvent.getForcedTrendingData(
      {required String serviceType,
      required String region}) = GetForcedTrendingData;
  const factory TrendingEvent.getHomeFeedData(
      {required List<Subscribe> channels}) = GetHomeFeedData;
  const factory TrendingEvent.getForcedHomeFeedData(
      {required List<Subscribe> channels}) = GetForcedHomeFeedData;
  // NewPipe feed
  const factory TrendingEvent.getNewPipeHomeFeedData(
      {required List<Subscribe> channels}) = GetNewPipeHomeFeedData;
  const factory TrendingEvent.getForcedNewPipeHomeFeedData(
      {required List<Subscribe> channels}) = GetForcedNewPipeHomeFeedData;

  // Personalized recommendations
  const factory TrendingEvent.getPersonalizedFeed(
      {required String profileName,
      required String serviceType}) = GetPersonalizedFeed;
  const factory TrendingEvent.getForcedPersonalizedFeed(
      {required String profileName,
      required String serviceType}) = GetForcedPersonalizedFeed;
  const factory TrendingEvent.loadMorePersonalizedFeed(
      {required String profileName,
      required String serviceType}) = LoadMorePersonalizedFeed;

  // Infinite scroll - load more events
  const factory TrendingEvent.loadMoreFeed() = LoadMoreFeed;
  const factory TrendingEvent.loadMoreTrending({required String serviceType}) =
      LoadMoreTrending;
  const factory TrendingEvent.loadMoreNewPipeFeed() = LoadMoreNewPipeFeed;
  const factory TrendingEvent.loadMoreNewPipeTrending() =
      LoadMoreNewPipeTrending;
  const factory TrendingEvent.loadMoreInvidiousTrending() =
      LoadMoreInvidiousTrending;
  // Reset display counts (for pull to refresh)
  const factory TrendingEvent.resetDisplayCounts() = ResetDisplayCounts;
}
