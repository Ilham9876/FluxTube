import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/presentation/watch/widgets/explode/pip_video_player.dart';
import 'package:fluxtube/presentation/watch/widgets/iFrame/pip_video_player.dart';
import 'package:fluxtube/presentation/watch/widgets/invidious/pip_video_player.dart';
import 'package:fluxtube/presentation/watch/widgets/newpipe/pip_video_player.dart';
import 'package:fluxtube/presentation/watch/widgets/pip_video_player.dart';

/// Global PiP overlay that shows the PiP player above all routes
/// This ensures PiP works regardless of which screen the user navigates to
class GlobalPipOverlay extends StatelessWidget {
  final Widget child;

  const GlobalPipOverlay({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      builder: (context, savedState) {
        return BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, settingsState) {
            return BlocBuilder<WatchBloc, WatchState>(
              builder: (context, watchState) {
                return Stack(
                  children: [
                    // Main app content
                    child,

                    // PiP overlays based on service type
                    if (_shouldShowPip(watchState, settingsState))
                      _buildPipPlayer(
                        watchState: watchState,
                        settingsState: settingsState,
                        savedState: savedState,
                      ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  bool _shouldShowPip(WatchState watchState, SettingsState settingsState) {
    return watchState.isPipEnabled &&
        watchState.selectedVideoBasicDetails?.id != null &&
        !settingsState.isPipDisabled;
  }

  Widget _buildPipPlayer({
    required WatchState watchState,
    required SettingsState settingsState,
    required SavedState savedState,
  }) {
    final isSaved = savedState.videoInfo?.id ==
            watchState.selectedVideoBasicDetails?.id &&
        savedState.videoInfo?.isSaved == true;

    switch (settingsState.ytService) {
      case 'invidious':
        return Positioned(
          child: InvidiousPipVideoPlayerWidget(
            key: ValueKey('pip_${watchState.selectedVideoBasicDetails!.id}'),
            watchInfo: watchState.invidiousWatchResp,
            videoId: watchState.selectedVideoBasicDetails!.id,
            playbackPosition: watchState.playBack,
            isSaved: isSaved,
            isHlsPlayer: settingsState.isHlsPlayer,
            subtitles: watchState.subtitles,
            watchState: watchState,
          ),
        );

      case 'piped':
        return Positioned(
          child: PipVideoPlayerWidget(
            key: ValueKey('pip_${watchState.selectedVideoBasicDetails!.id}'),
            watchInfo: watchState.watchResp,
            videoId: watchState.selectedVideoBasicDetails!.id,
            playbackPosition: watchState.playBack,
            isSaved: isSaved,
            isHlsPlayer: settingsState.isHlsPlayer,
            subtitles: watchState.subtitles,
            watchState: watchState,
          ),
        );

      case 'iframe':
        return Align(
          child: IFramePipVideoPlayer(
            key: ValueKey('pip_${watchState.selectedVideoBasicDetails!.id}'),
            id: watchState.selectedVideoBasicDetails!.id,
            isLive: watchState.explodeWatchResp.isLive,
            channelId: watchState.selectedVideoBasicDetails!.channelId!,
            settingsState: settingsState,
            watchState: watchState,
            isSaved: isSaved,
            savedState: savedState,
            watchInfo: watchState.explodeWatchResp,
            playBack: watchState.playBack,
          ),
        );

      case 'explode':
        return Positioned(
          child: ExplodePipVideoPlayerWidget(
            key: ValueKey('pip_${watchState.selectedVideoBasicDetails!.id}'),
            watchInfo: watchState.explodeWatchResp,
            videoId: watchState.selectedVideoBasicDetails!.id,
            playbackPosition: watchState.playBack,
            isSaved: isSaved,
            liveUrl: watchState.liveStreamUrl,
            availableVideoTracks: watchState.muxedStreams ?? [],
            subtitles: watchState.subtitles,
            watchState: watchState,
          ),
        );

      case 'newpipe':
        return NewPipePipVideoPlayerWidget(
          key: ValueKey('pip_${watchState.selectedVideoBasicDetails!.id}'),
          watchInfo: watchState.newPipeWatchResp,
          videoId: watchState.selectedVideoBasicDetails!.id,
          playbackPosition: watchState.playBack,
          isSaved: isSaved,
          watchState: watchState,
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
