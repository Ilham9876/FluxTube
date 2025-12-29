import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/domain/channel/models/piped/related_stream.dart';
import 'package:fluxtube/domain/channel/models/piped/tab.dart' as piped;
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/widgets/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:fluxtube/domain/watch/models/basic_info.dart';

class ChannelTabContent extends StatefulWidget {
  const ChannelTabContent({
    super.key,
    required this.tabs,
    required this.tabName,
    required this.locals,
  });

  final List<piped.Tab>? tabs;
  final String tabName;
  final S locals;

  @override
  State<ChannelTabContent> createState() => _ChannelTabContentState();
}

class _ChannelTabContentState extends State<ChannelTabContent>
    with AutomaticKeepAliveClientMixin {
  bool _hasLoaded = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _loadTabContent();
  }

  void _loadTabContent() {
    if (_hasLoaded) return;

    final tab = widget.tabs?.firstWhere(
      (t) => t.name?.toLowerCase() == widget.tabName,
      orElse: () => piped.Tab(),
    );

    if (tab?.data != null) {
      BlocProvider.of<ChannelBloc>(context).add(
        ChannelEvent.getChannelTabContent(
          tabData: tab!.data!,
          tabName: widget.tabName,
        ),
      );
      _hasLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final tab = widget.tabs?.firstWhere(
      (t) => t.name?.toLowerCase() == widget.tabName,
      orElse: () => piped.Tab(),
    );

    if (tab?.data == null) {
      return Center(
        child: Text(
          widget.tabName == 'shorts'
              ? widget.locals.noShorts
              : widget.locals.noPlaylists,
          style: TextStyle(color: kGreyColor),
        ),
      );
    }

    return BlocBuilder<ChannelBloc, ChannelState>(
      buildWhen: (previous, current) {
        if (widget.tabName == 'shorts') {
          return previous.shortsTabFetchStatus != current.shortsTabFetchStatus ||
              previous.shortsTabContent != current.shortsTabContent;
        } else {
          return previous.playlistsTabFetchStatus !=
                  current.playlistsTabFetchStatus ||
              previous.playlistsTabContent != current.playlistsTabContent;
        }
      },
      builder: (context, state) {
        final isShorts = widget.tabName == 'shorts';
        final fetchStatus = isShorts
            ? state.shortsTabFetchStatus
            : state.playlistsTabFetchStatus;
        final tabContent =
            isShorts ? state.shortsTabContent : state.playlistsTabContent;

        if (fetchStatus == ApiStatus.loading) {
          return Center(child: cIndicator(context));
        }

        if (fetchStatus == ApiStatus.error ||
            tabContent == null ||
            tabContent.content == null ||
            tabContent.content!.isEmpty) {
          return Center(
            child: Text(
              isShorts ? widget.locals.noShorts : widget.locals.noPlaylists,
              style: TextStyle(color: kGreyColor),
            ),
          );
        }

        final content = tabContent.content!;

        if (isShorts) {
          return _buildShortsGrid(context, content);
        } else {
          return _buildPlaylistList(context, content);
        }
      },
    );
  }

  Widget _buildShortsGrid(BuildContext context, List<RelatedStream> content) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 9 / 16,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: content.length,
      itemBuilder: (context, index) {
        final item = content[index];

        // Try to get thumbnail from various sources
        String thumbnailImage = item.thumbnail ?? item.thumbnailUrl ?? '';

        // If thumbnail is empty, try to generate from video URL
        if (thumbnailImage.isEmpty && item.url != null) {
          // Extract video ID from URL like /watch?v=VIDEO_ID or shorts/VIDEO_ID
          String? videoId;
          if (item.url!.contains('watch?v=')) {
            videoId = item.url!.split('watch?v=').last.split('&').first;
          } else if (item.url!.contains('/shorts/')) {
            videoId = item.url!.split('/shorts/').last.split('?').first;
          }
          if (videoId != null && videoId.isNotEmpty) {
            thumbnailImage = 'https://i.ytimg.com/vi/$videoId/hqdefault.jpg';
          }
        }

        return GestureDetector(
          onTap: () => _onVideoTap(context, item),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: thumbnailImage,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: kGreyColor?.withValues(alpha: 0.3),
              ),
              errorWidget: (context, url, error) => Container(
                color: kGreyColor?.withValues(alpha: 0.3),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlaylistList(BuildContext context, List<RelatedStream> content) {
    return ListView.builder(
      itemCount: content.length,
      itemBuilder: (context, index) {
        final item = content[index];
        final playlistId = item.url?.split('=').last ?? '';

        return PlaylistWidget(
          playlistId: playlistId,
          title: item.name ?? item.title,
          thumbnail: item.thumbnail ?? item.thumbnailUrl,
          videoCount: item.videos ?? item.views ?? 0,
          uploaderName: item.uploaderName,
          uploaderAvatar: item.uploaderAvatar,
          onTap: () {
            context.goNamed('playlist', pathParameters: {
              'playlistId': playlistId,
            });
          },
        );
      },
    );
  }

  void _onVideoTap(BuildContext context, RelatedStream item) {
    if (item.url != null) {
      final videoId = item.url!.split('=').last;
      final channelId = item.uploaderUrl?.split('/').last ?? '';

      BlocProvider.of<WatchBloc>(context).add(
        WatchEvent.setSelectedVideoBasicDetails(
          details: VideoBasicInfo(
            id: videoId,
            title: item.title,
            thumbnailUrl: item.thumbnail,
            channelName: item.uploaderName,
            channelId: channelId,
            uploaderVerified: item.uploaderVerified,
          ),
        ),
      );

      context.pushNamed('watch', pathParameters: {
        'videoId': videoId,
        'channelId': channelId,
      });
    }
  }
}
