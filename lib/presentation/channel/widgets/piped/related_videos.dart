import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/channel/models/piped/channel_resp.dart';
import 'package:fluxtube/domain/channel/models/piped/related_stream.dart';
import 'package:fluxtube/domain/watch/models/basic_info.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ChannelRelatedVideoSection extends StatelessWidget {
  ChannelRelatedVideoSection({
    super.key,
    required this.channelId,
    required this.locals,
    required this.channelInfo,
    required this.state,
  });

  final S locals;
  final String channelId;
  final ChannelState state;
  final ChannelResp channelInfo;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            !(state.moreChannelDetailsFetchStatus == ApiStatus.loading) &&
            !state.isMoreFetchCompleted) {
          BlocProvider.of<ChannelBloc>(context).add(
              ChannelEvent.getMoreChannelVideos(
                  channelId: channelId,
                  nextPage: state.pipedChannelResp?.nextpage,
                  serviceType: YouTubeServices.piped.name));
        }
        return false;
      },
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (index < state.pipedChannelResp!.relatedStreams!.length) {
            final RelatedStream videoInfo =
                channelInfo.relatedStreams![index];
            final String videoId = videoInfo.url!.split('=').last;
            final String channelId = videoInfo.uploaderUrl!.split("/").last;

            return GestureDetector(
              onTap: () {
                BlocProvider.of<WatchBloc>(context).add(
                    WatchEvent.setSelectedVideoBasicDetails(
                        details: VideoBasicInfo(
                            id: videoId,
                            title: videoInfo.title,
                            thumbnailUrl: videoInfo.thumbnail,
                            channelName: videoInfo.uploaderName,
                            channelThumbnailUrl: videoInfo.uploaderAvatar,
                            channelId: channelId,
                            uploaderVerified: videoInfo.uploaderVerified)));
                context.pushNamed('watch', pathParameters: {
                  'videoId': videoId,
                  'channelId': channelId,
                });
              },
              child: HomeVideoInfoCardWidget(
                channelId: channelId,
                subscribeRowVisible: false,
                cardInfo: videoInfo,
              ),
            );
          } else {
            if (state.moreChannelDetailsFetchStatus == ApiStatus.loading) {
              return cIndicator(context);
            } else if (state.isMoreFetchCompleted) {
              return const SizedBox();
            } else {
              return cIndicator(context);
            }
          }
        },
        separatorBuilder: (context, index) => kWidthBox10,
        itemCount: (channelInfo.relatedStreams?.length ?? 0) + 1,
      ),
    );
  }
}
