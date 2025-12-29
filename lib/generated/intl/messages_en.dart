// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'No subscribers', one: 'subscriber', other: 'subscribers')}";

  static String m1(count) =>
      "${Intl.plural(count, one: 'Reply', other: 'Replies')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'No views', one: 'view', other: 'views')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About"),
        "addProfile": MessageLookupByLibrary.simpleMessage("Add Profile"),
        "audioFocus": MessageLookupByLibrary.simpleMessage("Audio Focus"),
        "audioFocusDescription": MessageLookupByLibrary.simpleMessage(
            "Pause playback on interruptions"),
        "backupRestore":
            MessageLookupByLibrary.simpleMessage("Backup & Restore"),
        "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
            "Export or import your subscriptions"),
        "canada": MessageLookupByLibrary.simpleMessage("Canada"),
        "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
            "Cannot delete default profile"),
        "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
            "Cannot rename default profile"),
        "channelSubscribers": m0,
        "commentAuthorNotFound":
            MessageLookupByLibrary.simpleMessage("Not found"),
        "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Common"),
        "defaultProfile": MessageLookupByLibrary.simpleMessage("Default"),
        "defaultQuality":
            MessageLookupByLibrary.simpleMessage("Default Quality"),
        "deleteProfile": MessageLookupByLibrary.simpleMessage("Delete Profile"),
        "developer": MessageLookupByLibrary.simpleMessage("Developer"),
        "disablePipPlayer":
            MessageLookupByLibrary.simpleMessage("Disable PIP player"),
        "disableVideoHistory":
            MessageLookupByLibrary.simpleMessage("Disable video history"),
        "distractionFree":
            MessageLookupByLibrary.simpleMessage("Distraction Free"),
        "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
            "Enable HLS player to unlock all quality options. Disable if errors occur."),
        "exportData": MessageLookupByLibrary.simpleMessage("Export Data"),
        "exportSubscriptions":
            MessageLookupByLibrary.simpleMessage("Export Subscriptions"),
        "exportSuccess":
            MessageLookupByLibrary.simpleMessage("Export successful"),
        "filterAll": MessageLookupByLibrary.simpleMessage("All"),
        "filterChannels": MessageLookupByLibrary.simpleMessage("Channels"),
        "filterMusic": MessageLookupByLibrary.simpleMessage("Music"),
        "filterPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
        "filterVideos": MessageLookupByLibrary.simpleMessage("Videos"),
        "france": MessageLookupByLibrary.simpleMessage("France"),
        "hideComments": MessageLookupByLibrary.simpleMessage("Hide Comments"),
        "hideCommentsButtonFromWatchScreen":
            MessageLookupByLibrary.simpleMessage(
                "Hide comments button from watch screen."),
        "hideRelated": MessageLookupByLibrary.simpleMessage("Hide Related"),
        "hideRelatedVideosFromWatchScreen":
            MessageLookupByLibrary.simpleMessage(
                "Hide related videos from watch screen"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "hlsPlayer": MessageLookupByLibrary.simpleMessage("Hls Player"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "homeFeedMode": MessageLookupByLibrary.simpleMessage("Home Feed"),
        "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Auto"),
        "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
            "Show subscriptions if available, otherwise trending"),
        "homeFeedModeFeedOnly":
            MessageLookupByLibrary.simpleMessage("Subscriptions"),
        "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
            "Only show videos from subscribed channels"),
        "homeFeedModeTrendingOnly":
            MessageLookupByLibrary.simpleMessage("Trending"),
        "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
            "Always show trending videos only"),
        "importData": MessageLookupByLibrary.simpleMessage("Import Data"),
        "importError": MessageLookupByLibrary.simpleMessage("Import failed"),
        "importSubscriptions":
            MessageLookupByLibrary.simpleMessage("Import Subscriptions"),
        "importSuccess":
            MessageLookupByLibrary.simpleMessage("Import successful"),
        "includeTitle": MessageLookupByLibrary.simpleMessage("Include title"),
        "india": MessageLookupByLibrary.simpleMessage("India"),
        "instances": MessageLookupByLibrary.simpleMessage("Instances"),
        "interaction": MessageLookupByLibrary.simpleMessage("Interaction"),
        "intro": MessageLookupByLibrary.simpleMessage("Intro"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "musicOfftopic":
            MessageLookupByLibrary.simpleMessage("Music: Non-Music"),
        "netherlands": MessageLookupByLibrary.simpleMessage("Netherlands"),
        "newProfileName":
            MessageLookupByLibrary.simpleMessage("New Profile Name"),
        "noCommentsFound":
            MessageLookupByLibrary.simpleMessage("No Comments Found"),
        "noSubscriptions":
            MessageLookupByLibrary.simpleMessage("No Subscriptions"),
        "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
            "Subscribe to channels to see their videos here"),
        "noUploadDate": MessageLookupByLibrary.simpleMessage("No date"),
        "noUploaderName": MessageLookupByLibrary.simpleMessage("No name"),
        "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
            "No video source available, automatically changed to hls"),
        "noVideoDescription":
            MessageLookupByLibrary.simpleMessage("No description"),
        "noVideoTitle": MessageLookupByLibrary.simpleMessage("No title"),
        "openInBrowser":
            MessageLookupByLibrary.simpleMessage("Open in Browser"),
        "openLinksExternally": MessageLookupByLibrary.simpleMessage(
            "Open links in external browser"),
        "outro": MessageLookupByLibrary.simpleMessage("Outro"),
        "pauseOnCall":
            MessageLookupByLibrary.simpleMessage("Pause on Phone Call"),
        "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
            "Pause on Headphone Disconnect"),
        "playerBetterPlayer":
            MessageLookupByLibrary.simpleMessage("Better Player"),
        "playerOmniPlayer": MessageLookupByLibrary.simpleMessage("Omni Player"),
        "playerType": MessageLookupByLibrary.simpleMessage("Player Type"),
        "playerTypeDescription":
            MessageLookupByLibrary.simpleMessage("Video player engine"),
        "playlist": MessageLookupByLibrary.simpleMessage("Playlist"),
        "profileInUse": MessageLookupByLibrary.simpleMessage("Active"),
        "profileName": MessageLookupByLibrary.simpleMessage("Profile Name"),
        "profiles": MessageLookupByLibrary.simpleMessage("Profiles"),
        "profilesDescription": MessageLookupByLibrary.simpleMessage(
            "Create separate profiles for different accounts or preferences"),
        "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
        "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
        "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
        "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
        "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
        "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
        "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
        "readMoreText": MessageLookupByLibrary.simpleMessage("Read more"),
        "region": MessageLookupByLibrary.simpleMessage("Region"),
        "relatedTitle": MessageLookupByLibrary.simpleMessage("Related"),
        "renameProfile": MessageLookupByLibrary.simpleMessage("Rename Profile"),
        "repliesPlural": m1,
        "retrieveDislikeCounts":
            MessageLookupByLibrary.simpleMessage("Retrieve dislike counts"),
        "retrieveDislikes":
            MessageLookupByLibrary.simpleMessage("Retrieve Dislikes"),
        "retry": MessageLookupByLibrary.simpleMessage("Retry"),
        "saved": MessageLookupByLibrary.simpleMessage("Saved"),
        "savedVideosTitle":
            MessageLookupByLibrary.simpleMessage("Saved Videos"),
        "searchFilters": MessageLookupByLibrary.simpleMessage("Filters"),
        "seconds": MessageLookupByLibrary.simpleMessage("seconds"),
        "selectFile": MessageLookupByLibrary.simpleMessage("Select File"),
        "selfPromotion": MessageLookupByLibrary.simpleMessage("Self Promotion"),
        "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
        "serviceIFrame": MessageLookupByLibrary.simpleMessage("IFrame"),
        "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
        "serviceOmniPlayer":
            MessageLookupByLibrary.simpleMessage("Omni Player"),
        "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "share": MessageLookupByLibrary.simpleMessage("Share"),
        "showLessText": MessageLookupByLibrary.simpleMessage("Show less"),
        "skipInterval": MessageLookupByLibrary.simpleMessage("Skip Interval"),
        "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
            "Double-tap skip duration in seconds"),
        "sponsor": MessageLookupByLibrary.simpleMessage("Sponsor"),
        "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
        "sponsorBlockCategories":
            MessageLookupByLibrary.simpleMessage("Skip Categories"),
        "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
            "Skip sponsored segments automatically"),
        "subscribe": MessageLookupByLibrary.simpleMessage("Subscribe"),
        "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
            "\'Swipe down to dismiss\' disabled"),
        "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
            "\'Swipe up to dismiss\' enabled"),
        "switchProfile": MessageLookupByLibrary.simpleMessage("Switch Profile"),
        "switchRegion": MessageLookupByLibrary.simpleMessage(
            "Please consider switching to a different region for better results."),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
        "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
        "themeSystem": MessageLookupByLibrary.simpleMessage("System"),
        "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
            "There are no saved/history videos"),
        "thereIsNoSavedVideos":
            MessageLookupByLibrary.simpleMessage("There are no saved videos"),
        "translators": MessageLookupByLibrary.simpleMessage("Translators"),
        "trending": MessageLookupByLibrary.simpleMessage("Trending"),
        "unitedKingdom": MessageLookupByLibrary.simpleMessage("United Kingdom"),
        "unitedStates": MessageLookupByLibrary.simpleMessage("United States"),
        "unknown": MessageLookupByLibrary.simpleMessage("unknown"),
        "unknownQuality":
            MessageLookupByLibrary.simpleMessage("Unknown Quality"),
        "version": MessageLookupByLibrary.simpleMessage("Version"),
        "video": MessageLookupByLibrary.simpleMessage("Video"),
        "videoFit": MessageLookupByLibrary.simpleMessage("Video Fit"),
        "videoFitContain": MessageLookupByLibrary.simpleMessage("Contain"),
        "videoFitCover": MessageLookupByLibrary.simpleMessage("Cover"),
        "videoFitFill": MessageLookupByLibrary.simpleMessage("Fill"),
        "videoFitFitHeight": MessageLookupByLibrary.simpleMessage("Fit Height"),
        "videoFitFitWidth": MessageLookupByLibrary.simpleMessage("Fit Width"),
        "videoViews": m2,
        "youtubeService":
            MessageLookupByLibrary.simpleMessage("YouTube Service")
      };
}
