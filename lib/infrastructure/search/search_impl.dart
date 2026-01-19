import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/search/models/invidious/invidious_search_resp.dart';
import 'package:fluxtube/domain/search/models/newpipe/newpipe_search_resp.dart';
import 'package:fluxtube/domain/search/models/piped/search_resp.dart';
import 'package:fluxtube/domain/search/search_service.dart';
import 'package:fluxtube/infrastructure/newpipe/newpipe_channel.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  //Piped

  ///[getSearchResult] used to fetch search result from Piped.
  @override
  Future<Either<MainFailure, SearchResp>> getSearchResult(
      {required String query, required String filter}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${ApiEndPoints.search}$query&filter=$filter",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final SearchResp result = SearchResp.fromJson(response.data);

        return Right(result);
      } else {
        log('Err on getSearchResult: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getSearchResult: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  ///[getSearchSuggestion] used to fetch search suggestion from Piped.
  @override
  Future<Either<MainFailure, List>> getSearchSuggestion(
      {required String query}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${ApiEndPoints.suggestions}$query",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List result = response.data;

        return Right(result);
      } else {
        log('Err on getSearchSuggestion: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getSearchSuggestion: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  ///[getMoreSearchResult] used to fetch more search result from Piped.
  @override
  Future<Either<MainFailure, SearchResp>> getMoreSearchResult(
      {required String query,
      required String filter,
      required String? nextPage}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${ApiEndPoints.moreSearch}$query&filter=$filter&nextpage=$nextPage",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final SearchResp result = SearchResp.fromJson(response.data);

        return Right(result);
      } else {
        log('Err on getMoreSearchResult: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getMoreSearchResult: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  //Invidious

  ///[getInvidiousSearchResult] used to fetch search result from Invidious.
  @override
  Future<Either<MainFailure, List<InvidiousSearchResp>>>
      getInvidiousSearchResult(
          {required String query, required String type}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${InvidiousApiEndpoints.search}$query&type=$type",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // its getting a list with each InvidiousSearchResp
        final List<InvidiousSearchResp> result = List<InvidiousSearchResp>.from(
            response.data.map((x) => InvidiousSearchResp.fromJson(x)));

        return Right(result);
      } else {
        log('Err on getInvidiousSearchResult: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getInvidiousSearchResult: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  ///[getMoreInvidiousSearchResult] used to fetch more search result from Invidious.
  @override
  Future<Either<MainFailure, List>> getInvidiousSearchSuggestion(
      {required String query}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${InvidiousApiEndpoints.suggestions}$query",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List result = response.data["suggestions"];

        return Right(result);
      } else {
        log('Err on getInvidiousSearchSuggestion: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getInvidiousSearchSuggestion: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  ///[getMoreInvidiousSearchResult] used to fetch more search result from Invidious.
  @override
  Future<Either<MainFailure, List<InvidiousSearchResp>>>
      getMoreInvidiousSearchResult(
          {required String query,
          required String type,
          required int? page}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${InvidiousApiEndpoints.search}$query&type=$type&page=$page",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        // its getting a list with each InvidiousSearchResp
        final List<InvidiousSearchResp> result = List<InvidiousSearchResp>.from(
            response.data.map((x) => InvidiousSearchResp.fromJson(x)));

        return Right(result);
      } else {
        log('Err on getMoreInvidiousSearchResult: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getMoreInvidiousSearchResult: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  //NewPipe

  ///[getNewPipeSearchResult] used to fetch search result from NewPipe Extractor.
  @override
  Future<Either<MainFailure, NewPipeSearchResp>> getNewPipeSearchResult(
      {required String query, required String filter}) async {
    try {
      log('NewPipe: Searching for "$query" with filter $filter');
      final result = await NewPipeChannel.search(
        query: query,
        filter: filter,
      );
      return Right(result);
    } catch (e) {
      log('Err on getNewPipeSearchResult: $e');
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  ///[getMoreNewPipeSearchResult] used to fetch more search result from NewPipe Extractor.
  @override
  Future<Either<MainFailure, NewPipeSearchResp>> getMoreNewPipeSearchResult(
      {required String query,
      required String filter,
      required String nextPage}) async {
    try {
      log('NewPipe: Getting more search results for "$query"');
      final result = await NewPipeChannel.search(
        query: query,
        filter: filter,
        nextPage: nextPage,
      );
      return Right(result);
    } catch (e) {
      log('Err on getMoreNewPipeSearchResult: $e');
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }

  ///[getNewPipeSearchSuggestion] used to fetch search suggestions from NewPipe Extractor.
  @override
  Future<Either<MainFailure, List>> getNewPipeSearchSuggestion(
      {required String query}) async {
    try {
      log('NewPipe: Getting search suggestions for "$query"');
      final result = await NewPipeChannel.getSearchSuggestions(query);
      return Right(result);
    } catch (e) {
      log('Err on getNewPipeSearchSuggestion: $e');
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }
}
