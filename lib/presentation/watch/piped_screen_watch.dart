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

import 'widgets/sections/sections.dart';
import 'widgets/widgets.dart';

class PipedScreenWatch extends StatefulWidget {
  const PipedScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
  });

  final String id;
  final String channelId;

  @override
  State<PipedScreenWatch> createState() => _PipedScreenWatchState();
}

class _PipedScreenWatchState extends State<PipedScreenWatch> {
  @override
  void initState() {
    super.initState();
    // Dispatch events once when screen initializes
    final watchBloc = BlocProvider.of<WatchBloc>(context);
    final savedBloc = BlocProvider.of<SavedBloc>(context);
    final subscribeBloc = BlocProvider.of<SubscribeBloc>(context);

    watchBloc.add(WatchEvent.togglePip(value: false));
    watchBloc.add(WatchEvent.getWatchInfo(id: widget.id));
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
              previous.fetchWatchInfoStatus != current.fetchWatchInfoStatus ||
              previous.fetchSubtitlesStatus != current.fetchSubtitlesStatus ||
              previous.watchResp != current.watchResp ||
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
                final watchInfo = state.watchResp;

                bool isSaved = (savedState.videoInfo?.id == widget.id &&
                        savedState.videoInfo?.isSaved == true)
                    ? true
                    : false;

                if (state.fetchWatchInfoStatus == ApiStatus.error ||
                    (state.fetchWatchInfoStatus == ApiStatus.loaded &&
                        settingsState.isHlsPlayer &&
                        watchInfo.hls == null)) {
                  return ErrorRetryWidget(
                    lottie: 'assets/cat-404.zip',
                    onTap: () => BlocProvider.of<WatchBloc>(context)
                        .add(WatchEvent.getWatchInfo(id: widget.id)),
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
                                (state.fetchWatchInfoStatus ==
                                            ApiStatus.initial ||
                                        state.fetchWatchInfoStatus ==
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
                                    : VideoPlayerWidget(
                                        videoId: widget.id,
                                        watchInfo: state.watchResp,
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
                                      (state.fetchWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchWatchInfoStatus ==
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
                                      (state.fetchWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const SizedBox()
                                          : ViewRowWidget(
                                              views: watchInfo.views,
                                              uploadedDate:
                                                  watchInfo.uploadDate,
                                            ),

                                      kHeightBox10,

                                      // * like row
                                      (state.fetchWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerLikeWidget()
                                          : LikeSection(
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
                                      (state.fetchWatchInfoStatus ==
                                                  ApiStatus.initial ||
                                              state.fetchWatchInfoStatus ==
                                                  ApiStatus.loading)
                                          ? const ShimmerSubscribeWidget()
                                          : ChannelInfoSection(
                                              state: state,
                                              watchInfo: watchInfo,
                                              locals: locals),
                                      if (!state.isTapComments) const Divider(),
                                      kHeightBox10,

                                      // * description
                                      state.isDescriptionTapped
                                          ? DescriptionSection(
                                              height: height,
                                              watchInfo: watchInfo,
                                              locals: locals)
                                          :
                                          // * related videos
                                          state.isTapComments == false
                                              ? settingsState.isHideRelated
                                                  ? const SizedBox()
                                                  : (state.fetchWatchInfoStatus ==
                                                              ApiStatus
                                                                  .initial ||
                                                          state.fetchWatchInfoStatus ==
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
                                                      : RelatedVideoSection(
                                                          locals: locals,
                                                          watchInfo: watchInfo)
                                              //comments section
                                              : CommentSection(
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
