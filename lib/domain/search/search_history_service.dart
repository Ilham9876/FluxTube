import 'package:dartz/dartz.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/search/models/search_history.dart';

abstract class SearchHistoryService {
  Future<Either<MainFailure, List<LocalSearchHistory>>> getSearchHistory({
    String profileName = 'default',
    int limit = 20,
  });

  Future<Either<MainFailure, LocalSearchHistory>> addSearchQuery({
    required String query,
    String profileName = 'default',
  });

  Future<Either<MainFailure, bool>> deleteSearchQuery({
    required String query,
    String profileName = 'default',
  });

  Future<Either<MainFailure, bool>> clearAllSearchHistory({
    String profileName = 'default',
  });
}
