import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/presentation/watch/explode_screen_watch.dart';
import 'package:fluxtube/presentation/watch/iframe_screen_watch.dart';
import 'package:fluxtube/presentation/watch/invidious_screen_watch.dart';
import 'package:fluxtube/presentation/watch/newpipe_screen_watch.dart';
import 'package:fluxtube/presentation/watch/omni_screen_watch.dart';
import 'package:fluxtube/presentation/watch/piped_screen_watch.dart';

class ScreenWatch extends StatelessWidget {
  const ScreenWatch({
    super.key,
    required this.id,
    required this.channelId,
  });

  final String id;
  final String channelId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, settingsState) {
      final ytService = settingsState.ytService;
      final playerType = settingsState.playerType;
      final useOmniPlayer = playerType == PlayerType.omniPlayer.name;

      // If Omni Player is selected as YouTube Service, use OmniScreenWatch
      // (handles YouTube playback directly using its built-in YouTube support)
      if (ytService == YouTubeServices.omniPlayer.name) {
        return OmniScreenWatch(id: id, channelId: channelId);
      }

      // For other services, use service-specific screens
      // They will use either BetterPlayer or OmniPlayer based on playerType
      if (ytService == YouTubeServices.newpipe.name) {
        // NewPipe now uses media_kit player exclusively
        return NewPipeScreenWatch(
          id: id,
          channelId: channelId,
        );
      } else if (ytService == YouTubeServices.piped.name) {
        return PipedScreenWatch(
          id: id,
          channelId: channelId,
          useOmniPlayer: useOmniPlayer,
        );
      } else if (ytService == YouTubeServices.explode.name) {
        return ExplodeScreenWatch(
          id: id,
          channelId: channelId,
          useOmniPlayer: useOmniPlayer,
        );
      } else if (ytService == YouTubeServices.iframe.name) {
        return IFramScreenWatch(id: id, channelId: channelId);
      } else {
        // Invidious
        return InvidiousScreenWatch(
          id: id,
          channelId: channelId,
          useOmniPlayer: useOmniPlayer,
        );
      }
    });
  }
}
