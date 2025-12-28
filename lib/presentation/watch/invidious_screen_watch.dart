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

import 'widgets/invidious/comment_widgets.dart';
import 'widgets/invidious/description_section.dart';
import 'widgets/invidious/like_section.dart';
import 'widgets/invidious/related_video_section.dart';
import 'widgets/invidious/subscribe_section.dart';
import 'widgets/invidious/video_player_widget.dart';

class InvidiousScreenWatch extends StatefulWidget {
  const InvidiousScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
  });

  final String id;
  final String channelId;

  @override
  State<InvidiousScreenWatch> createState() => _InvidiousScreenWatchState();
}

class _InvidiousScreenWatchState extends State<InvidiousScreenWatch> {
  @override
  void initState() {
    super.initState();
    // Dispatch events once when screen initializes
    final watchBloc = BlocProvider.of<WatchBloc>(context);
    final savedBloc = BlocProvider.of<SavedBloc>(context);
    final subscribeBloc = BlocProvider.of<SubscribeBloc>(context);

    watchBloc.add(WatchEvent.togglePip(value: false));
    watchBloc.add(WatchEvent.getInvidiousWatchInfo(id: widget.id));
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
      buildWhen: (previous, current) =>
          previous.defaultQuality != current.defaultQuality ||
          previous.isHlsPlayer != current.isHlsPlayer ||
          previous.isPipDisabled != current.isPipDisabled ||
          previous.isHideRelated != current.isHideRelated,
      builder: (context, settingsState) {
        return BlocBuilder<WatchBloc, WatchState>(
          buildWhen: (previous, current) =>
              previous.fetchInvidiousWatchInfoStatus !=
                  current.fetchInvidiousWatchInfoStatus ||
              previous.fetchSubtitlesStatus != current.fetchSubtitlesStatus ||
              previous.invidiousWatchResp != current.invidiousWatchResp ||
              previous.isDescriptionTapped != current.isDescriptionTapped ||
              previous.isTapComments != current.isTapComments ||
              previous.subtitles != current.subtitles,
          builder: (context, state) {
            return BlocBuilder<SavedBloc, SavedState>(
              buildWhen: (previous, current) =>
                  previous.videoInfo?.id != current.videoInfo?.id ||
                  previous.videoInfo?.isSaved != current.videoInfo?.isSaved ||
                  previous.videoInfo?.playbackPosition !=
                      current.videoInfo?.playbackPosition,
              builder: (context, savedState) {
                final watchInfo = state.invidiousWatchResp;

                bool isSaved = (savedState.videoInfo?.id == widget.id &&
                        savedState.videoInfo?.isSaved == true)
                    ? true
                    : false;

                if (state.fetchInvidiousWatchInfoStatus == ApiStatus.error ||
                    (state.fetchInvidiousWatchInfoStatus == ApiStatus.loaded &&
                        settingsState.isHlsPlayer &&
                        watchInfo.dashUrl == null)) {
                  return ErrorRetryWidget(
                    lottie: 'assets/cat-404.zip',
                    onTap: () => BlocProvider.of<WatchBloc>(context)
                        .add(WatchEvent.getInvidiousWatchInfo(id: widget.id)),
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
                                (state.fetchInvidiousWatchInfoStatus ==
                                            ApiStatus.initial ||
                                        state.fetchInvidiousWatchInfoStatus ==
                                            ApiStatus.loading ||
                                        state.fetchSubtitlesStatus ==
                                            ApiStatus.loading)
                                    ? Container(
                                        height: 200,
                                        color: kBlackColor,
                                        child: Center(
                                          child: cIndicator(context),
                                        ),
                                      )
                                    : InvidiousVideoPlayerWidget(
                                        videoId: widget.id,
                                        watchInfo: state.invidiousWatchResp,
                                        defaultQuality:
                                            settingsState.defaultQuality,
                                        playbackPosition: savedState
                                                .videoInfo?.playbackPosition ??
                                            0,
                                        isSaved: isSaved,
                                        isHlsPlayer: settingsState.isHlsPlayer,
                                        subtitles: state.fetchSubtitlesStatus ==
                                                ApiStatus.loading
                                            ? []
                                            : state.subtitles,
                                      ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12, left: 20, right: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // * caption row
                                      (state.fetchInvidiousWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchInvidiousWatchInfoStatus ==
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

                                      // * views row
                                      (state.fetchInvidiousWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchInvidiousWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const SizedBox()
                                          : ViewRowWidget(
                                              views: watchInfo.viewCount,
                                              uploadedDate: watchInfo.published
                                                  .toString(),
                                            ),

                                      kHeightBox10,

                                      // * like row
                                      (state.fetchInvidiousWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchInvidiousWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerLikeWidget()
                                          : InvidiousLikeSection(
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
                                      (state.fetchInvidiousWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchInvidiousWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerSubscribeWidget()
                                          : InvidiousChannelInfoSection(
                                              state: state,
                                              watchInfo: watchInfo,
                                              locals: locals),
                                      if (!state.isTapComments) const Divider(),
                                      kHeightBox10,

                                      // * description
                                      state.isDescriptionTapped
                                          ? InvidiousDescriptionSection(
                                              height: height,
                                              watchInfo: watchInfo,
                                              locals: locals)
                                          :
                                          // * related videos
                                          state.isTapComments == false
                                              ? settingsState.isHideRelated
                                                  ? const SizedBox()
                                                  : (state.fetchInvidiousWatchInfoStatus ==
                                                              ApiStatus
                                                                  .initial ||
                                                          state.fetchInvidiousWatchInfoStatus ==
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
                                                      : InvidiousRelatedVideoSection(
                                                          locals: locals,
                                                          watchInfo: watchInfo)
                                              //comments section
                                              : InvidiousCommentSection(
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
