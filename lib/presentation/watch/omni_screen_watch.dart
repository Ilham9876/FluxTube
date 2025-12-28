import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/saved/models/local_store.dart';
import 'package:omni_video_player/omni_video_player.dart';

import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/presentation/watch/widgets/comment_widgets.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/description_section.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/like_section.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/subscribe_section.dart';
import 'package:fluxtube/widgets/widgets.dart';

import 'widgets/explode/related_video_section.dart';

class OmniScreenWatch extends StatefulWidget {
  const OmniScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
  });

  final String id;
  final String channelId;

  @override
  State<OmniScreenWatch> createState() => _OmniScreenWatchState();
}

class _OmniScreenWatchState extends State<OmniScreenWatch> {
  OmniPlaybackController? _controller;
  bool _isDismissibleDisabled = true;
  FToast? fToast;
  int _startPosition = 0;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast?.init(context);

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

    // Get start position from history
    _startPosition = savedBloc.state.localSavedHistoryVideos
            .firstWhere(
              (element) => element.id == widget.id,
              orElse: () => LocalStoreVideoInfo.init(),
            )
            .playbackPosition ??
        0;
  }

  void _onControllerCreated(OmniPlaybackController controller) {
    _controller = controller;
    // Seek to saved position after player initializes
    if (_startPosition > 0) {
      Future.delayed(const Duration(milliseconds: 500), () {
        _controller?.seekTo(Duration(seconds: _startPosition));
      });
    }
  }

  @override
  void dispose() {
    _updateVideoHistory();
    super.dispose();
  }

  Future<void> _updateVideoHistory() async {
    final currentPosition = _controller?.currentPosition;
    if (currentPosition != null && widget.id.isNotEmpty) {
      BlocProvider.of<WatchBloc>(context)
          .add(WatchEvent.updatePlayBack(playBack: currentPosition.inSeconds));
    }
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final double height = MediaQuery.of(context).size.height;
    final orientation = MediaQuery.of(context).orientation;

    return BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
      return BlocBuilder<WatchBloc, WatchState>(buildWhen: (previous, current) {
        return previous.fetchExplodeWatchInfoStatus !=
                current.fetchExplodeWatchInfoStatus ||
            previous.fetchSubtitlesStatus != current.fetchSubtitlesStatus ||
            previous.explodeWatchResp != current.explodeWatchResp;
      }, builder: (context, state) {
        return BlocBuilder<SavedBloc, SavedState>(
          buildWhen: (previous, current) =>
              previous.videoInfo?.id != current.videoInfo?.id ||
              previous.videoInfo?.isSaved != current.videoInfo?.isSaved ||
              previous.videoInfo?.playbackPosition !=
                  current.videoInfo?.playbackPosition,
          builder: (context, savedState) {
            if (state.fetchExplodeWatchInfoStatus == ApiStatus.error) {
              return ErrorRetryWidget(
                lottie: 'assets/cat-404.zip',
                onTap: () {
                  BlocProvider.of<WatchBloc>(context)
                      .add(WatchEvent.getExplodeWatchInfo(id: widget.id));
                  BlocProvider.of<WatchBloc>(context)
                      .add(WatchEvent.getExplodeMuxStreamInfo(id: widget.id));
                  BlocProvider.of<WatchBloc>(context).add(
                      WatchEvent.getExplodeRelatedVideoInfo(id: widget.id));
                },
              );
            } else {
              return DismissiblePage(
                direction: DismissiblePageDismissDirection.down,
                onDismissed: () async {
                  await _updateVideoHistory();
                  if (!context.mounted) return;
                  if (!settingsState.isPipDisabled) {
                    BlocProvider.of<WatchBloc>(context)
                        .add(WatchEvent.togglePip(value: true));
                  }
                  Navigator.pop(context);
                },
                isFullScreen: true,
                key: ValueKey(widget.id),
                disabled: (orientation == Orientation.landscape) ||
                    _isDismissibleDisabled,
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
                            GestureDetector(
                              onDoubleTap: () {
                                setState(() {
                                  _isDismissibleDisabled =
                                      !_isDismissibleDisabled;
                                  fToast?.showToast(
                                    child: Text(
                                      _isDismissibleDisabled
                                          ? locals.swipeDownToDismissDisabled
                                          : locals.swipeUpToDismissEnabled,
                                    ),
                                    gravity: ToastGravity.BOTTOM,
                                    toastDuration: const Duration(seconds: 2),
                                  );
                                });
                              },
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: OmniVideoPlayer(
                                  configuration: VideoPlayerConfiguration(
                                    videoSourceConfiguration:
                                        VideoSourceConfiguration.youtube(
                                      videoUrl: Uri.parse(
                                          'https://www.youtube.com/watch?v=${widget.id}'),
                                    ).copyWith(autoPlay: true),
                                  ),
                                  callbacks: VideoPlayerCallbacks(
                                    onControllerCreated: _onControllerCreated,
                                  ),
                                ),
                              ),
                            ),
                            _buildVideoInfo(
                                context, state, savedState, settingsState,
                                locals: locals, height: height),
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

  Widget _buildVideoInfo(
    BuildContext context,
    WatchState state,
    SavedState savedState,
    SettingsState settingsState, {
    required S locals,
    required double height,
  }) {
    final watchInfo = state.explodeWatchResp;
    return BlocBuilder<WatchBloc, WatchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Caption row
              (state.fetchExplodeWatchInfoStatus == ApiStatus.initial ||
                      state.fetchExplodeWatchInfoStatus == ApiStatus.loading)
                  ? CaptionRowWidget(
                      caption: state.selectedVideoBasicDetails?.title ?? '',
                      icon: state.isDescriptionTapped
                          ? CupertinoIcons.chevron_up
                          : CupertinoIcons.chevron_down,
                    )
                  : GestureDetector(
                      onTap: () => BlocProvider.of<WatchBloc>(context)
                          .add(WatchEvent.tapDescription()),
                      child: CaptionRowWidget(
                        caption: watchInfo.title,
                        icon: state.isDescriptionTapped
                            ? CupertinoIcons.chevron_up
                            : CupertinoIcons.chevron_down,
                      ),
                    ),

              kHeightBox5,

              // Views row
              (state.fetchExplodeWatchInfoStatus == ApiStatus.initial ||
                      state.fetchExplodeWatchInfoStatus == ApiStatus.loading)
                  ? const SizedBox()
                  : ViewRowWidget(
                      views: watchInfo.viewCount,
                      uploadedDate: watchInfo.uploadDate.toString(),
                    ),

              kHeightBox10,

              // Like row
              (state.fetchExplodeWatchInfoStatus == ApiStatus.initial ||
                      state.fetchExplodeWatchInfoStatus == ApiStatus.loading)
                  ? const ShimmerLikeWidget()
                  : ExplodeLikeSection(
                      id: widget.id,
                      state: state,
                      watchInfo: watchInfo,
                      pipClicked: () {
                        if (!settingsState.isPipDisabled) {
                          BlocProvider.of<WatchBloc>(context)
                              .add(WatchEvent.togglePip(value: true));
                        }
                        Navigator.pop(context);
                      },
                    ),

              kHeightBox10,

              const Divider(),

              // Channel info row
              (state.fetchExplodeWatchInfoStatus == ApiStatus.initial ||
                      state.fetchExplodeWatchInfoStatus == ApiStatus.loading)
                  ? const ShimmerSubscribeWidget()
                  : ExplodeChannelInfoSection(
                      state: state, watchInfo: watchInfo, locals: locals),
              if (!state.isTapComments) const Divider(),
              kHeightBox10,

              // Description or related videos or comments
              state.isDescriptionTapped
                  ? ExplodeDescriptionSection(
                      height: height, watchInfo: watchInfo, locals: locals)
                  : state.isTapComments == false
                      ? settingsState.isHideRelated
                          ? const SizedBox()
                          : (state.fetchExplodedRelatedVideosStatus ==
                                      ApiStatus.initial ||
                                  state.fetchExplodedRelatedVideosStatus ==
                                      ApiStatus.loading)
                              ? SizedBox(
                                  height: 350,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return const ShimmerRelatedVideoWidget();
                                      },
                                      separatorBuilder: (context, index) =>
                                          kWidthBox10,
                                      itemCount: 5),
                                )
                              : ExplodeRelatedVideoSection(
                                  locals: locals,
                                  watchInfo: watchInfo,
                                  related: state.relatedVideos ?? [],
                                )
                      : CommentSection(
                          videoId: widget.id,
                          state: state,
                          height: height,
                          locals: locals,
                        ),
            ],
          ),
        );
      },
    );
  }
}
