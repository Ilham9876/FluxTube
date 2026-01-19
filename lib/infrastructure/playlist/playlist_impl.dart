import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluxtube/domain/core/api_end_points.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/playlist/models/invidious/invidious_playlist_resp.dart';
import 'package:fluxtube/domain/playlist/models/piped/playlist_resp.dart';
import 'package:fluxtube/domain/playlist/playlist_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PlaylistService)
class PlaylistImpl implements PlaylistService {
  @override
  Future<Either<MainFailure, PlaylistResp>> getPlaylistData({
    required String playlistId,
  }) async {
    final dioClient = Dio();
    try {
      log('${ApiEndPoints.playlist}$playlistId');
      final Response response = await dioClient.get(
        '${ApiEndPoints.playlist}$playlistId',
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final PlaylistResp result = PlaylistResp.fromJson(response.data);
        return Right(result);
      } else {
        log('Err on getPlaylistData: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getPlaylistData: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  @override
  Future<Either<MainFailure, PlaylistResp>> getMorePlaylistVideos({
    required String playlistId,
    required String nextPage,
  }) async {
    final dioClient = Dio();
    try {
      final url = '${ApiEndPoints.morePlaylistVideos}$playlistId?nextpage=${Uri.encodeComponent(nextPage)}';
      log(url);
      final Response response = await dioClient.get(
        url,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final PlaylistResp result = PlaylistResp.fromJson(response.data);
        return Right(result);
      } else {
        log('Err on getMorePlaylistVideos: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getMorePlaylistVideos: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  @override
  Future<Either<MainFailure, InvidiousPlaylistResp>> getInvidiousPlaylistData({
    required String playlistId,
  }) async {
    final dioClient = Dio();
    try {
      log('${InvidiousApiEndpoints.playlist}$playlistId');
      final Response response = await dioClient.get(
        '${InvidiousApiEndpoints.playlist}$playlistId',
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final InvidiousPlaylistResp result = InvidiousPlaylistResp.fromJson(response.data);
        return Right(result);
      } else {
        log('Err on getInvidiousPlaylistData: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getInvidiousPlaylistData: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }
}
