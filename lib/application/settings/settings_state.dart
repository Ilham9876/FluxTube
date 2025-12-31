part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required String defaultLanguage,
    required String defaultQuality,
    required String defaultRegion,
    required String themeMode,
    required String? version,
    required bool isHistoryVisible,
    required bool isDislikeVisible,
    required bool isHlsPlayer,
    required bool isHideComments,
    required bool isHideRelated,
    required List<Instance> pipedInstances,
    required ApiStatus pipedInstanceStatus,
    required String instance,
    required List<Instance> invidiousInstances,
    required ApiStatus invidiousInstanceStatus,
    required String ytService,
    required String playerType,
    required bool initialized,
    required ApiStatus settingsStatus,
    required bool isPipDisabled,
    // Connection status tracking for UI feedback
    required String? connectingToInstance,
    required bool isTestingConnection,
    // Track if user's preferred instance failed (for showing snackbar)
    required bool userInstanceFailed,
    required String? failedInstanceName,
    // Search filter
    required String searchFilter,
    // Video fit mode (contain, cover, fill, fitWidth, fitHeight)
    required String videoFitMode,
    // Skip interval in seconds (for double-tap skip)
    required int skipInterval,
    // SponsorBlock settings
    required bool isSponsorBlockEnabled,
    required List<String> sponsorBlockCategories,
    // Open links in external browser
    required bool openLinksInBrowser,
    // Home feed display mode
    required String homeFeedMode,
    // Audio focus / pause on interruption
    required bool isAudioFocusEnabled,
    // Profiles
    required String currentProfile,
    required List<String> profiles,
    // Subtitle size (font size in pixels)
    required double subtitleSize,
  }) = _Initial;

  factory SettingsState.initialize() => SettingsState(
        defaultLanguage: 'en',
        defaultQuality: '720p',
        defaultRegion: 'IN',
        themeMode: 'system',
        version: "",
        isHistoryVisible: true,
        isDislikeVisible: false,
        isHlsPlayer: false,
        isHideComments: false,
        isHideRelated: false,
        pipedInstances: [],
        pipedInstanceStatus: ApiStatus.initial,
        // set by home (commom for piped and invidious)
        instance: BaseUrl.kBaseUrl,
        invidiousInstances: [],
        invidiousInstanceStatus: ApiStatus.initial,
        ytService: YouTubeServices.iframe.name,
        playerType: PlayerType.betterPlayer.name,
        initialized: false,
        settingsStatus: ApiStatus.initial,
        isPipDisabled: false,
        connectingToInstance: null,
        isTestingConnection: false,
        userInstanceFailed: false,
        failedInstanceName: null,
        // New settings
        searchFilter: 'all',
        videoFitMode: 'contain',
        skipInterval: 10,
        isSponsorBlockEnabled: false,
        sponsorBlockCategories: ['sponsor', 'intro', 'outro', 'selfpromo'],
        openLinksInBrowser: false,
        homeFeedMode: HomeFeedMode.feedOrTrending.name,
        isAudioFocusEnabled: true,
        currentProfile: 'default',
        profiles: ['default'],
        subtitleSize: 18.0,
      );
}
