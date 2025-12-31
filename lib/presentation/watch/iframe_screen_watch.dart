import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/presentation/watch/content/iframe.dart';
import 'package:fluxtube/widgets/widgets.dart';

class IFramScreenWatch extends StatefulWidget {
  const IFramScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
  });

  final String id;
  final String channelId;

  @override
  State<IFramScreenWatch> createState() => _IFramScreenWatchState();
}

class _IFramScreenWatchState extends State<IFramScreenWatch> {
  @override
  void initState() {
    super.initState();
    // Dispatch events once when screen initializes
    final watchBloc = BlocProvider.of<WatchBloc>(context);
    final savedBloc = BlocProvider.of<SavedBloc>(context);
    final subscribeBloc = BlocProvider.of<SubscribeBloc>(context);
    final currentProfile = BlocProvider.of<SettingsBloc>(context).state.currentProfile;

    watchBloc.add(WatchEvent.togglePip(value: false));
    watchBloc.add(WatchEvent.getExplodeWatchInfo(id: widget.id));
    watchBloc.add(WatchEvent.getExplodeMuxStreamInfo(id: widget.id));
    watchBloc.add(WatchEvent.getExplodeRelatedVideoInfo(id: widget.id));
    watchBloc.add(WatchEvent.getSubtitles(id: widget.id));

    savedBloc.add(SavedEvent.getAllVideoInfoList(profileName: currentProfile));
    savedBloc.add(SavedEvent.checkVideoInfo(id: widget.id, profileName: currentProfile));
    subscribeBloc.add(SubscribeEvent.checkSubscribeInfo(id: widget.channelId, profileName: currentProfile));
  }

  @override
  Widget build(BuildContext context) {
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
            bool isSaved = (savedState.videoInfo?.id == widget.id &&
                    savedState.videoInfo?.isSaved == true)
                ? true
                : false;

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
              return PopScope(
                canPop: true,
                onPopInvokedWithResult: (didPop, _) {
                  if (!settingsState.isPipDisabled) {
                    BlocProvider.of<WatchBloc>(context)
                        .add(WatchEvent.togglePip(value: true));
                  }
                },
                child: IFrameVideoPlayerContent(
                  id: widget.id,
                  isLive: state.explodeWatchResp.isLive,
                  channelId: widget.channelId,
                  settingsState: settingsState,
                  isSaved: isSaved,
                  savedState: savedState,
                ),
              );
            }
          },
        );
      });
    });
  }
}
