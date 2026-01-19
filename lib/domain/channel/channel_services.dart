import 'package:dartz/dartz.dart';
import 'package:fluxtube/domain/channel/models/invidious/invidious_channel_resp.dart';
import 'package:fluxtube/domain/channel/models/invidious/latest_video.dart';
import 'package:fluxtube/domain/channel/models/newpipe/newpipe_channel_resp.dart';
import 'package:fluxtube/domain/channel/models/piped/channel_resp.dart';
import 'package:fluxtube/domain/channel/models/piped/tab_content.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';

abstract class ChannelServices {
  //Piped

  ///[getChannelData] fetches channel data from the Piped API
  Future<Either<MainFailure, ChannelResp>> getChannelData(
      {required String channelId});

  ///[getMoreChannelVideos] fetches more channel videos from the Piped API
  Future<Either<MainFailure, ChannelResp>> getMoreChannelVideos(
      {required String channelId, required String? nextPage});

  ///[getChannelTabContent] fetches channel tab content from the Piped API
  Future<Either<MainFailure, TabContent>> getChannelTabContent(
      {required String data});

  //Invidious

  ///[getInvidiousChannelData] fetches channel data from the Invidious API
  Future<Either<MainFailure, InvidiousChannelResp>> getInvidiousChannelData(
      {required String channelId});

  ///[getMoreInvidiousChannelVideos] fetches more channel videos from the Invidious API
  Future<Either<MainFailure, List<LatestVideo>>> getMoreInvidiousChannelVideos(
      {required String channelId, required int page});

  //NewPipe

  ///[getNewPipeChannelData] fetches channel data from NewPipe Extractor
  Future<Either<MainFailure, NewPipeChannelResp>> getNewPipeChannelData(
      {required String channelId});
}
