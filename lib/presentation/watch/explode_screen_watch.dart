import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/watch/models/explode/explode_watch.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/description_section.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/like_section.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/subscribe_section.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/video_player_widget.dart';
import 'package:fluxtube/presentation/watch/widgets/invidious/comment_widgets.dart';
import 'package:fluxtube/presentation/watch/widgets/omni_video_player_widget.dart';
import 'package:fluxtube/presentation/watch/widgets/player_error_widget.dart';
import 'package:fluxtube/widgets/widgets.dart';

import 'widgets/explode/related_video_section.dart';

class ExplodeScreenWatch extends StatefulWidget {
  const ExplodeScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
    this.useOmniPlayer = false,
  });

  final String id;
  final String channelId;
  final bool useOmniPlayer;

  @override
  State<ExplodeScreenWatch> createState() => _ExplodeScreenWatchState();
}

class _ExplodeScreenWatchState extends State<ExplodeScreenWatch> {
  @override
  void initState() {
    super.initState();
    // Dispatch events once when screen initializes
    final watchBloc = BlocProvider.of<WatchBloc>(context);
    final savedBloc = BlocProvider.of<SavedBloc>(context);
    final subscribeBloc = BlocProvider.of<SubscribeBloc>(context);

    watchBloc.add(WatchEvent.togglePip(value: false));
    watchBloc.add(WatchEvent.getExplodeWatchInfo(id: widget.id));
    watchBloc.add(WatchEvent.getExplodeMuxStreamInfo(id: widget.id));
    watchBloc.add(WatchEvent.getExplodeRelatedVideoInfo(id: widget.id));
    watchBloc.add(WatchEvent.getSubtitles(id: widget.id));

    savedBloc.add(const SavedEvent.getAllVideoInfoList());
    savedBloc.add(SavedEvent.checkVideoInfo(id: widget.id));
    subscribeBloc.add(SubscribeEvent.checkSubscribeInfo(id: widget.channelId));
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final double height = MediaQuery.of(context).size.height;

    return BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
      return BlocBuilder<WatchBloc, WatchState>(buildWhen: (previous, current) {
        return previous.fetchExplodeWatchInfoStatus !=
                current.fetchExplodeWatchInfoStatus ||
            previous.fetchSubtitlesStatus != current.fetchSubtitlesStatus ||
            previous.explodeWatchResp != current.explodeWatchResp ||
            previous.muxedStreams != current.muxedStreams ||
            previous.liveStreamUrl != current.liveStreamUrl;
      }, builder: (context, state) {
        return BlocBuilder<SavedBloc, SavedState>(
          buildWhen: (previous, current) =>
              previous.videoInfo?.id != current.videoInfo?.id ||
              previous.videoInfo?.isSaved != current.videoInfo?.isSaved ||
              previous.videoInfo?.playbackPosition !=
                  current.videoInfo?.playbackPosition,
          builder: (context, savedState) {
            final watchInfo = state.explodeWatchResp;

            bool isSaved = (savedState.videoInfo?.id == widget.id &&
                    savedState.videoInfo?.isSaved == true)
                ? true
                : false;

            // Check if there's a stream URL error (no muxed streams and no live URL)
            final bool hasStreamError =
                state.fetchExplodeWatchInfoStatus == ApiStatus.loaded &&
                state.fetchExplodeMuxedStreamsStatus == ApiStatus.loaded &&
                (state.muxedStreams == null || state.muxedStreams!.isEmpty) &&
                state.liveStreamUrl == null;

            if (state.fetchExplodeWatchInfoStatus == ApiStatus.error) {
              return ErrorRetryWidget(
                lottie: 'assets/cat-404.zip',
                onTap: () {
                  BlocProvider.of<WatchBloc>(context)
                      .add(WatchEvent.getExplodeWatchInfo(id: widget.id));
                  BlocProvider.of<WatchBloc>(context)
                      .add(WatchEvent.getExplodeMuxStreamInfo(id: widget.id));
                  BlocProvider.of<WatchBloc>(context)
                      .add(WatchEvent.getExplodeRelatedVideoInfo(id: widget.id));
                },
              );
            } else {
              return DismissiblePage(
                direction: DismissiblePageDismissDirection.down,
                onDismissed: () {
                  if (!settingsState.isPipDisabled) {
                    BlocProvider.of<WatchBloc>(context)
                        .add(WatchEvent.togglePip(value: true));
                  }
                  Navigator.pop(context);
                },
                isFullScreen: true,
                key: ValueKey(widget.id),
                child: PopScope(
                  canPop: true,
                  onPopInvokedWithResult: (didPop, _) {
                    if (!settingsState.isPipDisabled) {
                      BlocProvider.of<WatchBloc>(context)
                          .add(WatchEvent.togglePip(value: true));
                    }
                  },
                  child: Scaffold(
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            (state.fetchExplodeWatchInfoStatus ==
                                        ApiStatus.initial ||
                                    state.fetchExplodeWatchInfoStatus ==
                                        ApiStatus.loading ||
                                    state.fetchSubtitlesStatus ==
                                        ApiStatus.loading)
                                ? Container(
                                    height: 230,
                                    color: kBlackColor,
                                    child: Center(
                                      child: cIndicator(context),
                                    ),
                                  )
                                : hasStreamError
                                    ? PlayerErrorWidget(
                                        message: 'Video streams unavailable. This video may be restricted or age-gated.',
                                        onRetry: () {
                                          BlocProvider.of<WatchBloc>(context)
                                              .add(WatchEvent.getExplodeMuxStreamInfo(id: widget.id));
                                        },
                                      )
                                    : widget.useOmniPlayer
                                        ? _buildOmniPlayer(
                                            state.muxedStreams ?? [],
                                            state.liveStreamUrl,
                                            savedState.videoInfo?.playbackPosition ?? 0,
                                          )
                                        : ExplodeVideoPlayerWidget(
                                            videoId: widget.id,
                                            watchInfo: state.explodeWatchResp,
                                            defaultQuality:
                                                settingsState.defaultQuality,
                                            playbackPosition: savedState
                                                    .videoInfo?.playbackPosition ??
                                                0,
                                            isSaved: isSaved,
                                            liveUrl: state.liveStreamUrl,
                                            availableVideoTracks:
                                                state.muxedStreams ?? [],
                                            subtitles: (state.fetchSubtitlesStatus ==
                                                        ApiStatus.loading ||
                                                    state.fetchSubtitlesStatus ==
                                                        ApiStatus.initial)
                                                ? []
                                                : state.subtitles,
                                            selectedVideoBasicDetails:
                                                state.selectedVideoBasicDetails,
                                          ),
                            BlocBuilder<WatchBloc, WatchState>(
                              builder: (context, state) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // * caption row
                                      (state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? CaptionRowWidget(
                                              caption: state
                                                      .selectedVideoBasicDetails
                                                      ?.title ??
                                                  '',
                                              icon: state.isDescriptionTapped
                                                  ? CupertinoIcons.chevron_up
                                                  : CupertinoIcons.chevron_down,
                                            )
                                          : GestureDetector(
                                              onTap: () =>
                                                  BlocProvider.of<WatchBloc>(
                                                          context)
                                                      .add(WatchEvent
                                                          .tapDescription()),
                                              child: CaptionRowWidget(
                                                caption: watchInfo.title,
                                                icon: state.isDescriptionTapped
                                                    ? CupertinoIcons.chevron_up
                                                    : CupertinoIcons
                                                        .chevron_down,
                                              ),
                                            ),

                                      kHeightBox5,

                                      // * views row
                                      (state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const SizedBox()
                                          : ViewRowWidget(
                                              views: watchInfo.viewCount,
                                              uploadedDate: watchInfo.uploadDate
                                                  .toString(),
                                            ),

                                      kHeightBox10,

                                      // * like row
                                      (state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerLikeWidget()
                                          : ExplodeLikeSection(
                                              id: widget.id,
                                              state: state,
                                              watchInfo: watchInfo,
                                              pipClicked: () {
                                                BlocProvider.of<WatchBloc>(
                                                        context)
                                                    .add(WatchEvent.togglePip(
                                                        value: true));
                                                Navigator.pop(context);
                                              },
                                            ),

                                      kHeightBox10,

                                      const Divider(),

                                      // * channel info row
                                      (state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchExplodeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerSubscribeWidget()
                                          : ExplodeChannelInfoSection(
                                              state: state,
                                              watchInfo: watchInfo,
                                              locals: locals),
                                      if (!state.isTapComments) const Divider(),
                                      kHeightBox10,

                                      // * description
                                      state.isDescriptionTapped
                                          ? ExplodeDescriptionSection(
                                              height: height,
                                              watchInfo: watchInfo,
                                              locals: locals)
                                          :
                                          // * related videos
                                          state.isTapComments == false
                                              ? settingsState.isHideRelated
                                                  ? const SizedBox()
                                                  : (state.fetchExplodedRelatedVideosStatus ==
                                                              ApiStatus
                                                                  .initial ||
                                                          state.fetchExplodedRelatedVideosStatus ==
                                                              ApiStatus.loading)
                                                      ? SizedBox(
                                                          height: 350,
                                                          child: ListView
                                                              .separated(
                                                                  scrollDirection:
                                                                      Axis
                                                                          .horizontal,
                                                                  itemBuilder:
                                                                      (context,
                                                                          index) {
                                                                    return const ShimmerRelatedVideoWidget();
                                                                  },
                                                                  separatorBuilder:
                                                                      (context,
                                                                              index) =>
                                                                          kWidthBox10,
                                                                  itemCount: 5),
                                                        )
                                                      : ExplodeRelatedVideoSection(
                                                          locals: locals,
                                                          watchInfo: watchInfo,
                                                          related: state
                                                                  .relatedVideos ??
                                                              [],
                                                        )
                                              //comments section
                                              : InvidiousCommentSection(
                                                  videoId: widget.id,
                                                  state: state,
                                                  height: height,
                                                  locals: locals,
                                                ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        );
      });
    });
  }

  Widget _buildOmniPlayer(List<MyMuxedStreamInfo> muxedStreams, String? liveUrl, int startPosition) {
    // Try to get stream URL: for live streams use liveUrl (HLS), otherwise use muxed streams
    String? streamUrl;
    final bool isLive = liveUrl != null;

    // For live streams, always use the live URL (HLS)
    if (isLive) {
      streamUrl = liveUrl;
    } else if (muxedStreams.isNotEmpty) {
      // Get first muxed stream URL for regular videos
      streamUrl = muxedStreams.first.url;
    }

    if (streamUrl == null) {
      return const PlayerErrorWidget(
        message: 'No stream URL available',
      );
    }

    return OmniVideoPlayerWidget.network(
      url: streamUrl,
      // Don't set start position for live streams
      startPosition: isLive ? 0 : startPosition,
      isHls: isLive,
      onControllerCreated: (controller) {
        // Controller can be used for playback position tracking if needed
      },
    );
  }
}
