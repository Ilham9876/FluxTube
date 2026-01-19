import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/settings/settings_bloc.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:fluxtube/widgets/widgets.dart';

class ScreenInstances extends StatelessWidget {
  const ScreenInstances({super.key});

  @override
  Widget build(BuildContext context) {
    final locals = S.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(locals.instances),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Piped',
              ),
              Tab(
                text: 'Invidious',
              ),
            ],
          ),
        ),
        body: const SafeArea(
          child: TabBarView(
            children: [
              PipedInstanceListView(),
              InvidiousInstanceListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class PipedInstanceListView extends StatelessWidget {
  const PipedInstanceListView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SettingsBloc>(context)
          .add(SettingsEvent.fetchPipedInstances());
    });
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.pipedInstanceStatus == ApiStatus.loading ||
            state.pipedInstanceStatus == ApiStatus.initial) {
          return _buildLoadingState(context, state);
        }

        final instances = state.pipedInstances.toList();

        return Column(
          children: [
            // Auto-connect header
            _buildAutoConnectHeader(
              context,
              state,
              onAutoConnect: () {
                // Force re-fetch and auto-connect
                BlocProvider.of<SettingsBloc>(context)
                    .add(SettingsEvent.fetchPipedInstances(forceRefresh: true));
              },
              instanceType: 'Piped',
            ),
            const Divider(height: 1),
            // Instance list
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  onTap: () async {
                    final selectedInstance = instances[index];
                    if (state.instance != selectedInstance.api) {
                      BlocProvider.of<SettingsBloc>(context).add(
                        SettingsEvent.setInstance(instanceApi: selectedInstance.api),
                      );

                      if (state.ytService == YouTubeServices.invidious.name ||
                          state.ytService == YouTubeServices.newpipe.name) {
                        BlocProvider.of<SettingsBloc>(context).add(
                          SettingsEvent.setYTService(service: YouTubeServices.piped),
                        );
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Switched to ${selectedInstance.name}'),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  leading: state.instance == instances[index].api
                      ? const Icon(CupertinoIcons.check_mark, color: Colors.green)
                      : const Icon(CupertinoIcons.circle, color: Colors.grey),
                  title: Text(
                    instances[index].name,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: state.instance == instances[index].api
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                  ),
                  subtitle: Text(
                    instances[index].locations.replaceAll(',', ' '),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: state.instance == instances[index].api
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Active',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : null,
                ),
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemCount: instances.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

class InvidiousInstanceListView extends StatelessWidget {
  const InvidiousInstanceListView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SettingsBloc>(context)
          .add(SettingsEvent.fetchInvidiousInstances());
    });
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state.invidiousInstanceStatus == ApiStatus.loading ||
            state.invidiousInstanceStatus == ApiStatus.initial) {
          return _buildLoadingState(context, state);
        }

        final instances = state.invidiousInstances.toList();

        return Column(
          children: [
            // Auto-connect header
            _buildAutoConnectHeader(
              context,
              state,
              onAutoConnect: () {
                // Force re-fetch and auto-connect
                BlocProvider.of<SettingsBloc>(context)
                    .add(SettingsEvent.fetchInvidiousInstances(forceRefresh: true));
              },
              instanceType: 'Invidious',
            ),
            const Divider(height: 1),
            // Instance list
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  onTap: () async {
                    final selectedInstance = instances[index];
                    if (state.instance != selectedInstance.api) {
                      BlocProvider.of<SettingsBloc>(context).add(
                        SettingsEvent.setInstance(instanceApi: selectedInstance.api),
                      );

                      if (state.ytService != YouTubeServices.invidious.name) {
                        BlocProvider.of<SettingsBloc>(context).add(
                          SettingsEvent.setYTService(service: YouTubeServices.invidious),
                        );
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Switched to ${selectedInstance.name}'),
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  leading: state.instance == instances[index].api
                      ? const Icon(CupertinoIcons.check_mark, color: Colors.green)
                      : const Icon(CupertinoIcons.circle, color: Colors.grey),
                  title: Text(
                    instances[index].name,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: state.instance == instances[index].api
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                  ),
                  subtitle: Text(
                    instances[index].locations.replaceAll(',', ' '),
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: state.instance == instances[index].api
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Active',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      : null,
                ),
                separatorBuilder: (context, index) => const Divider(height: 1),
                itemCount: instances.length,
              ),
            ),
          ],
        );
      },
    );
  }
}

Widget _buildLoadingState(BuildContext context, SettingsState state) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cIndicator(context),
        if (state.isTestingConnection && state.connectingToInstance != null) ...[
          const SizedBox(height: 16),
          Text(
            'Testing connection...',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              state.connectingToInstance!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    ),
  );
}

Widget _buildAutoConnectHeader(
  BuildContext context,
  SettingsState state, {
  required VoidCallback onAutoConnect,
  required String instanceType,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Auto-Connect',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Automatically find the best working $instanceType instance',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                  ),
                ],
              ),
            ),
            FilledButton.icon(
              onPressed: state.isTestingConnection ? null : onAutoConnect,
              icon: state.isTestingConnection
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.auto_fix_high, size: 18),
              label: Text(state.isTestingConnection ? 'Testing...' : 'Auto'),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
          ],
        ),
        if (state.userInstanceFailed && state.failedInstanceName != null) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.orange.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '${state.failedInstanceName} was unavailable. Switched to a working instance.',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.orange.shade800,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 8),
        Text(
          'Or select an instance manually from the list below:',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                fontStyle: FontStyle.italic,
              ),
        ),
      ],
    ),
  );
}
