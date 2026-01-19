//--------SEARCH HISTORY MODEL--------//
// Domain model for search history

class LocalSearchHistory {
  String query;
  DateTime? searchedAt;
  int searchCount;
  String profileName;

  LocalSearchHistory({
    required this.query,
    this.searchedAt,
    this.searchCount = 1,
    this.profileName = 'default',
  });
}
