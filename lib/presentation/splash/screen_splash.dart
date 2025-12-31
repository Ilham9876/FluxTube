import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeSettings();
  }

  void _initializeSettings() {
    // Initialize the settings bloc first
    // Subscriptions will be loaded after settings are initialized (in _handleState)
    BlocProvider.of<SettingsBloc>(context)
        .add(SettingsEvent.initializeSettings());
  }

  bool _subscriptionsLoaded = false;

  void _loadProfileData(String profileName) {
    if (_subscriptionsLoaded) return;
    _subscriptionsLoaded = true;

    BlocProvider.of<SubscribeBloc>(context)
        .add(SubscribeEvent.getAllSubscribeList(profileName: profileName));
    BlocProvider.of<SavedBloc>(context)
        .add(SavedEvent.getAllVideoInfoList(profileName: profileName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return BlocBuilder<SubscribeBloc, SubscribeState>(
          builder: (context, subscribeState) {
            _handleState(state, subscribeState);

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 24),
                  // Show connection status when testing instances
                  if (state.isTestingConnection && state.connectingToInstance != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          Text(
                            'Connecting to API...',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.connectingToInstance!,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  else if (state.settingsStatus == ApiStatus.loading)
                    Text(
                      'Loading settings...',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    )
                  else if (subscribeState.subscribeStatus == ApiStatus.loading)
                    Text(
                      'Loading subscriptions...',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  void _handleState(SettingsState state, SubscribeState subscribeState) async {
    final settingsBloc = BlocProvider.of<SettingsBloc>(context);

    if (!state.initialized) return;

    // Load profile data once settings are initialized
    _loadProfileData(state.currentProfile);

    final bool isNewPipe = state.ytService == YouTubeServices.newpipe.name;
    final bool isInvidious = state.ytService == YouTubeServices.invidious.name;

    // NewPipe doesn't need instance selection - skip directly
    if (isNewPipe) {
      if ((state.settingsStatus == ApiStatus.loaded ||
              state.settingsStatus == ApiStatus.error) &&
          (subscribeState.subscribeStatus == ApiStatus.loaded ||
              subscribeState.subscribeStatus == ApiStatus.error)) {
        await Future.delayed(const Duration());
        if (mounted) {
          Router.neglect(context, () {
            context.goNamed('main');
          });
        }
      }
      return;
    }

    // For other services, fetch instances
    if (isInvidious) {
      if (state.invidiousInstances.isEmpty &&
          state.invidiousInstanceStatus == ApiStatus.initial) {
        settingsBloc.add(SettingsEvent.fetchInvidiousInstances());
        return;
      }
    } else {
      if (state.pipedInstances.isEmpty &&
          state.pipedInstanceStatus == ApiStatus.initial) {
        settingsBloc.add(SettingsEvent.fetchPipedInstances());
        return;
      }
    }

    final bool instancesReady;
    if (isInvidious) {
      instancesReady = state.invidiousInstanceStatus == ApiStatus.loaded ||
          state.invidiousInstanceStatus == ApiStatus.error;
    } else {
      instancesReady = state.pipedInstanceStatus == ApiStatus.loaded ||
          state.pipedInstanceStatus == ApiStatus.error;
    }

    if ((state.settingsStatus == ApiStatus.loaded ||
            state.settingsStatus == ApiStatus.error) &&
        instancesReady &&
        !state.isTestingConnection &&
        (subscribeState.subscribeStatus == ApiStatus.loaded ||
            subscribeState.subscribeStatus == ApiStatus.error)) {
      await Future.delayed(const Duration());
      if (mounted) {
        Router.neglect(context, () {
          context.goNamed('main');
        });
      }
    }
  }
}
