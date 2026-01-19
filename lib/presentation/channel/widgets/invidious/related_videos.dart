import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/channel/models/invidious/invidious_channel_resp.dart';
import 'package:fluxtube/domain/channel/models/invidious/latest_video.dart';
import 'package:fluxtube/domain/watch/models/basic_info.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/presentation/channel/widgets/invidious/video_info_card.dart';
import 'package:fluxtube/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class InvidiousChannelRelatedVideoSection extends StatelessWidget {
  const InvidiousChannelRelatedVideoSection({
    super.key,
    required this.channelId,
    required this.locals,
    required this.channelInfo,
    required this.state,
  });

  final S locals;
  final String channelId;
  final ChannelState state;
  final InvidiousChannelResp channelInfo;

  @override
  Widget build(BuildContext context) {
    final videos = channelInfo.latestVideos ?? [];

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
            !state.isMoreFetchCompleted) {
          BlocProvider.of<ChannelBloc>(context).add(
              ChannelEvent.getMoreChannelVideos(
                  channelId: channelId,
                  nextPage: null,
                  serviceType: YouTubeServices.invidious.name));
        }
        return false;
      },
      child: ListView.separated(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          if (index < videos.length) {
            final LatestVideo videoInfo = videos[index];
            final String videoId = videoInfo.videoId!;
            final String channelId = videoInfo.authorId!;

            return GestureDetector(
              onTap: () {
                BlocProvider.of<WatchBloc>(context).add(
                    WatchEvent.setSelectedVideoBasicDetails(
                        details: VideoBasicInfo(
                            id: videoId,
                            title: videoInfo.title,
                            thumbnailUrl:
                                videoInfo.videoThumbnails!.last.url,
                            channelName: videoInfo.author,
                            channelThumbnailUrl:
                                channelInfo.authorThumbnails!.last.url!,
                            channelId: channelId,
                            uploaderVerified: videoInfo.authorVerified)));
                context.pushNamed('watch', pathParameters: {
                  'videoId': videoId,
                  'channelId': channelId,
                });
              },
              child: InvidiousChannelRelatedVideoInfoCardWidget(
                channelId: channelId,
                latestVideo: videoInfo,
                authorUrl: channelInfo.authorThumbnails!.last.url,
                subscribeRowVisible: false,
              ),
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
        // Only add extra item for loading indicator if not completed
        itemCount: videos.length + (state.isMoreFetchCompleted ? 0 : 1),
      ),
    );
  }
}
