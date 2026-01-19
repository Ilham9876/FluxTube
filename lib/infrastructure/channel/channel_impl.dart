import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fluxtube/domain/channel/channel_services.dart';
import 'package:fluxtube/domain/channel/models/invidious/invidious_channel_resp.dart';
import 'package:fluxtube/domain/channel/models/invidious/latest_video.dart';
import 'package:fluxtube/domain/channel/models/newpipe/newpipe_channel_resp.dart';
import 'package:fluxtube/domain/channel/models/piped/channel_resp.dart';
import 'package:fluxtube/domain/channel/models/piped/tab_content.dart';
import 'package:fluxtube/domain/core/api_end_points.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/infrastructure/newpipe/newpipe_channel.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChannelServices)
class ChannelImpl extends ChannelServices {
  //Piped

  ///[getChannelData] fetches channel data from the Piped API
  @override
  Future<Either<MainFailure, ChannelResp>> getChannelData(
      {required String channelId}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${ApiEndPoints.channel}$channelId",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final ChannelResp result = ChannelResp.fromJson(response.data);

        return Right(result);
      } else {
        log('Err on GetChannelData: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on GetChannelData: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  ///[getMoreChannelVideos] fetches more channel videos from the Piped API
  @override
  Future<Either<MainFailure, ChannelResp>> getMoreChannelVideos(
      {required String channelId, required String? nextPage}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${ApiEndPoints.moreChannelVideos}$channelId?nextpage=$nextPage",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final ChannelResp result = ChannelResp.fromJson(response.data);

        return Right(result);
      } else {
        log('Err on getMoreChannelVideos: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getMoreChannelVideos: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  ///[getChannelTabContent] fetches channel tab content from the Piped API
  @override
  Future<Either<MainFailure, TabContent>> getChannelTabContent(
      {required String data}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${ApiEndPoints.channelTabs}${Uri.encodeComponent(data)}",
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final TabContent result = TabContent.fromJson(response.data);
        return Right(result);
      } else {
        log('Err on getChannelTabContent: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getChannelTabContent: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  //Invidious

  ///[getInvidiousChannelData] fetches channel data from the Invidious API
  @override
  Future<Either<MainFailure, InvidiousChannelResp>> getInvidiousChannelData(
      {required String channelId}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${InvidiousApiEndpoints.channel}$channelId",
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final InvidiousChannelResp result =
            InvidiousChannelResp.fromJson(response.data);

        return Right(result);
      } else {
        log('Err on getInvidiousChannelData: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getInvidiousChannelData: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  ///[getMoreInvidiousChannelVideos] fetches more channel videos from the Invidious API
  @override
  Future<Either<MainFailure, List<LatestVideo>>> getMoreInvidiousChannelVideos(
      {required String channelId, required int page}) async {
    final dioClient = Dio();
    try {
      final Response response = await dioClient.get(
        "${InvidiousApiEndpoints.channelVideos}$channelId/videos?page=$page",
        options: Options(
          followRedirects: false,
          validateStatus: (status) => true,
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> data = response.data['videos'] ?? response.data;
        final List<LatestVideo> videos = data
            .map((json) => LatestVideo.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(videos);
      } else {
        log('Err on getMoreInvidiousChannelVideos: ${response.statusCode}');
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log('Err on getMoreInvidiousChannelVideos: $e');
      return const Left(MainFailure.clientFailure());
    } finally {
      dioClient.close();
    }
  }

  //NewPipe

  ///[getNewPipeChannelData] fetches channel data from NewPipe Extractor
  @override
  Future<Either<MainFailure, NewPipeChannelResp>> getNewPipeChannelData(
      {required String channelId}) async {
    try {
      log('NewPipe: Getting channel data for $channelId');
      final result = await NewPipeChannel.getChannel(channelId);
      return Right(result);
    } catch (e) {
      log('Err on getNewPipeChannelData: $e');
      return Left(MainFailure.unknown(message: e.toString()));
    }
  }
}
