import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/settings/settings_bloc.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/generated/l10n.dart';

class PlaybackSettingsSection extends StatelessWidget {
  const PlaybackSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.isAudioFocusEnabled != current.isAudioFocusEnabled ||
          previous.openLinksInBrowser != current.openLinksInBrowser,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locals.audioFocus,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16),
            ),
            kHeightBox10,
            ListTile(
              title: Text(locals.pauseOnCall,
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(locals.audioFocusDescription),
              leading: const Icon(Icons.phone_paused),
              trailing: Switch(
                value: state.isAudioFocusEnabled,
                onChanged: (_) {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(SettingsEvent.toggleAudioFocus());
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: Text(locals.openInBrowser,
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(locals.openLinksExternally),
              leading: const Icon(Icons.open_in_browser),
              trailing: Switch(
                value: state.openLinksInBrowser,
                onChanged: (_) {
                  BlocProvider.of<SettingsBloc>(context)
                      .add(SettingsEvent.toggleOpenLinksInBrowser());
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
