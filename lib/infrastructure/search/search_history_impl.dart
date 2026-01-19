import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/search/models/search_history.dart';
import 'package:fluxtube/domain/search/search_history_service.dart';
import 'package:fluxtube/infrastructure/database/database.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchHistoryService)
class SearchHistoryImpl implements SearchHistoryService {
  AppDatabase get db => AppDatabase.instance;

  // Convert Drift SearchHistoryEntry to domain LocalSearchHistory
  LocalSearchHistory _toDomain(SearchHistoryEntry entry) {
    return LocalSearchHistory(
      query: entry.query,
      searchedAt: entry.searchedAt,
      searchCount: entry.searchCount,
      profileName: entry.profileName,
    );
  }

  @override
  Future<Either<MainFailure, List<LocalSearchHistory>>> getSearchHistory({
    String profileName = 'default',
    int limit = 20,
  }) async {
    try {
      final allResults = await db.getSearchHistory(profileName);
      // Apply limit in Dart
      final results = allResults.take(limit).toList();
      return Right(results.map(_toDomain).toList());
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, LocalSearchHistory>> addSearchQuery({
    required String query,
    String profileName = 'default',
  }) async {
    try {
      final trimmedQuery = query.trim();
      if (trimmedQuery.isEmpty) {
        return const Left(MainFailure.clientFailure());
      }

      // Check if query already exists
      final existing = await db.getSearchEntry(trimmedQuery, profileName);

      late LocalSearchHistory searchHistory;

      if (existing != null) {
        // Update existing entry
        searchHistory = LocalSearchHistory(
          query: trimmedQuery,
          searchedAt: DateTime.now(),
          searchCount: existing.searchCount + 1,
          profileName: profileName,
        );
      } else {
        // Create new entry
        searchHistory = LocalSearchHistory(
          query: trimmedQuery,
          searchedAt: DateTime.now(),
          searchCount: 1,
          profileName: profileName,
        );
      }

      await db.upsertSearchHistory(SearchHistoryEntriesCompanion.insert(
        query: searchHistory.query,
        profileName: searchHistory.profileName,
        searchedAt: searchHistory.searchedAt ?? DateTime.now(),
        searchCount: Value(searchHistory.searchCount),
      ));

      return Right(searchHistory);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> deleteSearchQuery({
    required String query,
    String profileName = 'default',
  }) async {
    try {
      await db.deleteSearchEntry(query, profileName);
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }

  @override
  Future<Either<MainFailure, bool>> clearAllSearchHistory({
    String profileName = 'default',
  }) async {
    try {
      await db.clearSearchHistory(profileName);
      return const Right(true);
    } catch (e) {
      return const Left(MainFailure.serverFailure());
    }
  }
}
