import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/watch/watch_bloc.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/domain/watch/models/basic_info.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_watch_resp.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/widgets/related_video_widget.dart';
import 'package:go_router/go_router.dart';

class NewPipeRelatedVideoSection extends StatelessWidget {
  const NewPipeRelatedVideoSection({
    super.key,
    required this.locals,
    required this.watchInfo,
  });

  final S locals;
  final NewPipeWatchResp watchInfo;

  @override
  Widget build(BuildContext context) {
    final relatedStreams = watchInfo.relatedStreams ?? [];

    if (relatedStreams.isEmpty) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          locals.relatedTitle,
          style: TextStyle(
              color: Theme.of(context).textTheme.labelMedium!.color,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        ),
        kHeightBox20,
        SizedBox(
          height: 250,
          width: double.infinity,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final related = relatedStreams[index];
                final videoId = _extractVideoId(related.url);
                final channelId = _extractChannelId(related.uploaderUrl);

                if (videoId == null) return const SizedBox();

                return GestureDetector(
                    onTap: () {
                      BlocProvider.of<WatchBloc>(context).add(
                          WatchEvent.setSelectedVideoBasicDetails(
                              details: VideoBasicInfo(
                                  id: videoId,
                                  title: related.name,
                                  thumbnailUrl: related.thumbnailUrl,
                                  channelName: related.uploaderName,
                                  channelThumbnailUrl: related.uploaderAvatarUrl,
                                  channelId: channelId,
                                  uploaderVerified: related.uploaderVerified)));
                      context.pushReplacementNamed('watch', pathParameters: {
                        'videoId': videoId,
                        'channelId': channelId ?? '',
                      });
                    },
                    child: RelatedVideoWidget(
                      title: related.name ?? locals.noVideoTitle,
                      thumbnailUrl: related.thumbnailUrl ?? '',
                      duration: related.duration,
                    ));
              },
              separatorBuilder: (context, index) => kWidthBox10,
              itemCount: relatedStreams.length),
        ),
      ],
    );
  }

  String? _extractVideoId(String? url) {
    if (url == null) return null;
    final uri = Uri.tryParse(url);
    if (uri != null) {
      // Handle youtube.com/watch?v=VIDEO_ID format
      if (uri.queryParameters.containsKey('v')) {
        return uri.queryParameters['v'];
      }
      // Handle youtu.be/VIDEO_ID format
      if (uri.host == 'youtu.be' && uri.pathSegments.isNotEmpty) {
        return uri.pathSegments.first;
      }
    }
    return null;
  }

  String? _extractChannelId(String? uploaderUrl) {
    if (uploaderUrl == null) return null;
    final uri = Uri.tryParse(uploaderUrl);
    if (uri != null && uri.pathSegments.isNotEmpty) {
      final channelIndex = uri.pathSegments.indexOf('channel');
      if (channelIndex != -1 && channelIndex + 1 < uri.pathSegments.length) {
        return uri.pathSegments[channelIndex + 1];
      }
    }
    return null;
  }
}
