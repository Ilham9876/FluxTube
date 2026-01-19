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
  const ChannelRelatedVideoSection({
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
    final videos = channelInfo.relatedStreams ?? [];

    // Show empty state if no videos
    if (videos.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.video_library_outlined,
                size: 48,
                color: Theme.of(context).colorScheme.outline,
              ),
              const SizedBox(height: 16),
              Text(
                locals.noVideosFound,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (scrollInfo) {
        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
            !(state.moreChannelDetailsFetchStatus == ApiStatus.loading) &&
            !state.isMoreFetchCompleted &&
            state.pipedChannelResp?.nextpage != null) {
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
          if (index < videos.length) {
            final RelatedStream videoInfo = videos[index];
            final String videoId = videoInfo.url!.split('=').last;
            final String channelId = videoInfo.uploaderUrl!.split("/").last;

            return HomeVideoInfoCardWidget(
              channelId: channelId,
              subscribeRowVisible: false,
              cardInfo: videoInfo,
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
            );
          } else {
            // Only show loading indicator if there's more to load
            if (state.moreChannelDetailsFetchStatus == ApiStatus.loading) {
              return cIndicator(context);
            } else {
              return const SizedBox();
            }
          }
        },
        separatorBuilder: (context, index) => kWidthBox10,
        // Only add extra item for loading indicator if there's potentially more content
        itemCount: videos.length + (state.isMoreFetchCompleted || state.pipedChannelResp?.nextpage == null ? 0 : 1),
      ),
    );
  }
}
