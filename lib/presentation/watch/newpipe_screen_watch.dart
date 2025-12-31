import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/widgets/widgets.dart';

import 'widgets/newpipe/comment_widgets.dart';
import 'widgets/newpipe/description_section.dart';
import 'widgets/newpipe/like_section.dart';
import 'widgets/newpipe/related_video_section.dart';
import 'widgets/newpipe/subscribe_section.dart';
import 'widgets/newpipe/video_player_widget.dart';

class NewPipeScreenWatch extends StatefulWidget {
  const NewPipeScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
  });

  final String id;
  final String channelId;

  @override
  State<NewPipeScreenWatch> createState() => _NewPipeScreenWatchState();
}

class _NewPipeScreenWatchState extends State<NewPipeScreenWatch> {
  @override
  void initState() {
    super.initState();
    final watchBloc = BlocProvider.of<WatchBloc>(context);
    final savedBloc = BlocProvider.of<SavedBloc>(context);
    final subscribeBloc = BlocProvider.of<SubscribeBloc>(context);

    watchBloc.add(WatchEvent.togglePip(value: false));
    watchBloc.add(WatchEvent.getNewPipeWatchInfo(id: widget.id));

    savedBloc.add(const SavedEvent.getAllVideoInfoList());
    savedBloc.add(SavedEvent.checkVideoInfo(id: widget.id));
    subscribeBloc.add(SubscribeEvent.checkSubscribeInfo(id: widget.channelId));
  }

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);
    final double height = MediaQuery.of(context).size.height;

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.defaultQuality != current.defaultQuality ||
          previous.isHlsPlayer != current.isHlsPlayer ||
          previous.isPipDisabled != current.isPipDisabled ||
          previous.isHideRelated != current.isHideRelated ||
          previous.videoFitMode != current.videoFitMode ||
          previous.skipInterval != current.skipInterval,
      builder: (context, settingsState) {
        return BlocBuilder<WatchBloc, WatchState>(
          buildWhen: (previous, current) =>
              previous.fetchNewPipeWatchInfoStatus !=
                  current.fetchNewPipeWatchInfoStatus ||
              previous.newPipeWatchResp != current.newPipeWatchResp ||
              previous.isDescriptionTapped != current.isDescriptionTapped ||
              previous.isTapComments != current.isTapComments ||
              previous.fetchNewPipeCommentsStatus !=
                  current.fetchNewPipeCommentsStatus ||
              previous.newPipeComments != current.newPipeComments ||
              previous.fetchMoreNewPipeCommentsStatus !=
                  current.fetchMoreNewPipeCommentsStatus ||
              previous.isMoreNewPipeCommentsFetchCompleted !=
                  current.isMoreNewPipeCommentsFetchCompleted,
          builder: (context, state) {
            return BlocBuilder<SavedBloc, SavedState>(
              buildWhen: (previous, current) =>
                  previous.videoInfo?.id != current.videoInfo?.id ||
                  previous.videoInfo?.isSaved != current.videoInfo?.isSaved ||
                  previous.videoInfo?.playbackPosition !=
                      current.videoInfo?.playbackPosition,
              builder: (context, savedState) {
                final watchInfo = state.newPipeWatchResp;

                bool isSaved = (savedState.videoInfo?.id == widget.id &&
                        savedState.videoInfo?.isSaved == true)
                    ? true
                    : false;

                if (state.fetchNewPipeWatchInfoStatus == ApiStatus.error) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(locals.retry),
                    ),
                    body: SafeArea(
                      child: SingleChildScrollView(
                        child: InstanceAutoCheckWidget(
                          videoId: widget.id,
                          lottie: 'assets/cat-404.zip',
                          onRetry: () => BlocProvider.of<WatchBloc>(context)
                              .add(WatchEvent.getNewPipeWatchInfo(id: widget.id)),
                        ),
                      ),
                    ),
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
                                (state.fetchNewPipeWatchInfoStatus ==
                                            ApiStatus.initial ||
                                        state.fetchNewPipeWatchInfoStatus ==
                                            ApiStatus.loading)
                                    ? Container(
                                        height: 200,
                                        color: kBlackColor,
                                        child: Center(
                                          child: cIndicator(context),
                                        ),
                                      )
                                    : NewPipeVideoPlayerWidget(
                                        videoId: widget.id,
                                        watchInfo: state.newPipeWatchResp,
                                        defaultQuality:
                                            settingsState.defaultQuality,
                                        playbackPosition: savedState
                                                .videoInfo?.playbackPosition ??
                                            0,
                                        isSaved: isSaved,
                                        isHlsPlayer: settingsState.isHlsPlayer,
                                        videoFitMode: settingsState.videoFitMode,
                                        skipInterval: settingsState.skipInterval,
                                        isAudioFocusEnabled: settingsState.isAudioFocusEnabled,
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      (state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? CaptionRowWidget(
                                              caption: state
                                                      .selectedVideoBasicDetails
                                                      ?.title ??
                                                  locals.noVideoTitle,
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
                                                caption: watchInfo.title ??
                                                    locals.noVideoTitle,
                                                icon: state.isDescriptionTapped
                                                    ? CupertinoIcons.chevron_up
                                                    : CupertinoIcons
                                                        .chevron_down,
                                              ),
                                            ),

                                      kHeightBox5,

                                      (state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const SizedBox()
                                          : ViewRowWidget(
                                              views: watchInfo.viewCount,
                                              uploadedDate: watchInfo.textualUploadDate ?? '',
                                            ),

                                      kHeightBox10,

                                      (state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerLikeWidget()
                                          : NewPipeLikeSection(
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

                                      (state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchNewPipeWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerSubscribeWidget()
                                          : NewPipeChannelInfoSection(
                                              state: state,
                                              watchInfo: watchInfo,
                                              locals: locals),
                                      if (!state.isTapComments) const Divider(),
                                      kHeightBox10,

                                      state.isDescriptionTapped
                                          ? NewPipeDescriptionSection(
                                              height: height,
                                              watchInfo: watchInfo,
                                              locals: locals)
                                          : state.isTapComments == false
                                              ? settingsState.isHideRelated
                                                  ? const SizedBox()
                                                  : (state.fetchNewPipeWatchInfoStatus ==
                                                              ApiStatus
                                                                  .initial ||
                                                          state.fetchNewPipeWatchInfoStatus ==
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
                                                      : NewPipeRelatedVideoSection(
                                                          locals: locals,
                                                          watchInfo: watchInfo)
                                              : NewPipeCommentSection(
                                                  videoId: widget.id,
                                                  state: state,
                                                  height: height,
                                                  locals: locals,
                                                ),
                                    ],
                                  ),
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
          },
        );
      },
    );
  }
}
