part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.getSearchResult({
    required String query,
    required String? filter,
    required String serviceType,
  }) = GetSearchResult;

  const factory SearchEvent.getMoreSearchResult(
      {required String query,
      required String? filter,
      required String? nextPage,
    required String serviceType,
      }) = GetMoreSearchResult;

  const factory SearchEvent.getSearchSuggestion({
    required String query,
    required String serviceType,
  }) = GetSearchSuggestion;

  // Search History Events
  const factory SearchEvent.getSearchHistory({
    @Default('default') String profileName,
    @Default(20) int limit,
  }) = GetSearchHistory;

  const factory SearchEvent.saveSearchQuery({
    required String query,
    @Default('default') String profileName,
  }) = SaveSearchQuery;

  const factory SearchEvent.deleteSearchQuery({
    required String query,
    @Default('default') String profileName,
  }) = DeleteSearchQuery;

  const factory SearchEvent.clearSearchHistory({
    @Default('default') String profileName,
  }) = ClearSearchHistory;
}
