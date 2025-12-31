import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';

class BackupSettingsSection extends StatelessWidget {
  const BackupSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);

    return BlocBuilder<SettingsBloc, SettingsState>(
      buildWhen: (previous, current) =>
          previous.currentProfile != current.currentProfile,
      builder: (context, settingsState) {
        final currentProfile = settingsState.currentProfile;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              locals.backupRestore,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16),
            ),
            if (currentProfile != 'default')
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Profile: $currentProfile',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            kHeightBox10,
            ListTile(
              title: Text(locals.exportSubscriptions,
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(locals.backupRestoreDescription),
              leading: const Icon(Icons.upload),
              onTap: () async {
                BlocProvider.of<SettingsBloc>(context).add(
                    SettingsEvent.exportSubscriptions(
                        profileName: currentProfile));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(locals.exportSuccess),
                    behavior: SnackBarBehavior.floating,
                    action: SnackBarAction(
                      label: locals.share,
                      onPressed: () {
                        // Share the exported file
                        Share.share('FluxTube subscriptions exported');
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(locals.importSubscriptions,
                  style: Theme.of(context).textTheme.titleMedium),
              subtitle: Text(locals.selectFile),
              leading: const Icon(Icons.download),
              onTap: () {
                // Note: Would need file_picker package for full implementation
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('File picker integration required'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
