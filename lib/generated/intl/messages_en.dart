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
      "Pause playback on interruptions",
    ),
    "backupRestore": MessageLookupByLibrary.simpleMessage("Backup & Restore"),
    "backupRestoreDescription": MessageLookupByLibrary.simpleMessage(
      "Export or import your subscriptions",
    ),
    "canada": MessageLookupByLibrary.simpleMessage("Canada"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cannotDeleteDefault": MessageLookupByLibrary.simpleMessage(
      "Cannot delete default profile",
    ),
    "cannotRenameDefault": MessageLookupByLibrary.simpleMessage(
      "Cannot rename default profile",
    ),
    "channelSubscribers": m0,
    "channels": MessageLookupByLibrary.simpleMessage("Channels"),
    "clearAll": MessageLookupByLibrary.simpleMessage("Clear all"),
    "clearAllHistory": MessageLookupByLibrary.simpleMessage(
      "Clear all history",
    ),
    "clearAllHistoryConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to clear all watch history?",
    ),
    "clearAllSaved": MessageLookupByLibrary.simpleMessage("Clear all saved"),
    "clearAllSavedConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove all saved videos?",
    ),
    "commentAuthorNotFound": MessageLookupByLibrary.simpleMessage("Not found"),
    "commentsDisabled": MessageLookupByLibrary.simpleMessage(
      "Comments are disabled",
    ),
    "commonSettingsTitle": MessageLookupByLibrary.simpleMessage("Common"),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "copyLink": MessageLookupByLibrary.simpleMessage("Copy link"),
    "dateAdded": MessageLookupByLibrary.simpleMessage("Date added"),
    "defaultProfile": MessageLookupByLibrary.simpleMessage("Default"),
    "defaultQuality": MessageLookupByLibrary.simpleMessage("Default Quality"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteProfile": MessageLookupByLibrary.simpleMessage("Delete Profile"),
    "deleteVideo": MessageLookupByLibrary.simpleMessage("Delete video"),
    "deleteVideoConfirm": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to remove this video?",
    ),
    "developer": MessageLookupByLibrary.simpleMessage("Developer"),
    "disablePipPlayer": MessageLookupByLibrary.simpleMessage(
      "Disable PIP player",
    ),
    "disableVideoHistory": MessageLookupByLibrary.simpleMessage(
      "Disable video history",
    ),
    "dislike": MessageLookupByLibrary.simpleMessage("Dislike"),
    "distractionFree": MessageLookupByLibrary.simpleMessage("Distraction Free"),
    "duration": MessageLookupByLibrary.simpleMessage("Duration"),
    "enableHlsPlayerDescription": MessageLookupByLibrary.simpleMessage(
      "Enable HLS player to unlock all quality options. Disable if errors occur.",
    ),
    "exportData": MessageLookupByLibrary.simpleMessage("Export Data"),
    "exportSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Export Subscriptions",
    ),
    "exportSuccess": MessageLookupByLibrary.simpleMessage("Export successful"),
    "filterAll": MessageLookupByLibrary.simpleMessage("All"),
    "filterChannels": MessageLookupByLibrary.simpleMessage("Channels"),
    "filterMusic": MessageLookupByLibrary.simpleMessage("Music"),
    "filterPlaylists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "filterVideos": MessageLookupByLibrary.simpleMessage("Videos"),
    "france": MessageLookupByLibrary.simpleMessage("France"),
    "hideComments": MessageLookupByLibrary.simpleMessage("Hide Comments"),
    "hideCommentsButtonFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Hide comments button from watch screen.",
    ),
    "hideRelated": MessageLookupByLibrary.simpleMessage("Hide Related"),
    "hideRelatedVideosFromWatchScreen": MessageLookupByLibrary.simpleMessage(
      "Hide related videos from watch screen",
    ),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "hlsPlayer": MessageLookupByLibrary.simpleMessage("Hls Player"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "homeFeedMode": MessageLookupByLibrary.simpleMessage("Home Feed"),
    "homeFeedModeAuto": MessageLookupByLibrary.simpleMessage("Auto"),
    "homeFeedModeAutoHint": MessageLookupByLibrary.simpleMessage(
      "Show subscriptions if available, otherwise trending",
    ),
    "homeFeedModeFeedOnly": MessageLookupByLibrary.simpleMessage(
      "Subscriptions",
    ),
    "homeFeedModeFeedOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Only show videos from subscribed channels",
    ),
    "homeFeedModeTrendingOnly": MessageLookupByLibrary.simpleMessage(
      "Trending",
    ),
    "homeFeedModeTrendingOnlyHint": MessageLookupByLibrary.simpleMessage(
      "Always show trending videos only",
    ),
    "importData": MessageLookupByLibrary.simpleMessage("Import Data"),
    "importError": MessageLookupByLibrary.simpleMessage("Import failed"),
    "importSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Import Subscriptions",
    ),
    "importSuccess": MessageLookupByLibrary.simpleMessage("Import successful"),
    "includeTitle": MessageLookupByLibrary.simpleMessage("Include title"),
    "india": MessageLookupByLibrary.simpleMessage("India"),
    "instances": MessageLookupByLibrary.simpleMessage("Instances"),
    "interaction": MessageLookupByLibrary.simpleMessage("Interaction"),
    "intro": MessageLookupByLibrary.simpleMessage("Intro"),
    "language": MessageLookupByLibrary.simpleMessage("Language"),
    "library": MessageLookupByLibrary.simpleMessage("Library"),
    "like": MessageLookupByLibrary.simpleMessage("Like"),
    "musicOfftopic": MessageLookupByLibrary.simpleMessage("Music: Non-Music"),
    "netherlands": MessageLookupByLibrary.simpleMessage("Netherlands"),
    "newProfileName": MessageLookupByLibrary.simpleMessage("New Profile Name"),
    "noCommentsFound": MessageLookupByLibrary.simpleMessage(
      "No Comments Found",
    ),
    "noHistory": MessageLookupByLibrary.simpleMessage("No watch history"),
    "noPlaylists": MessageLookupByLibrary.simpleMessage(
      "No playlists available",
    ),
    "noSavedVideos": MessageLookupByLibrary.simpleMessage("No saved videos"),
    "noShorts": MessageLookupByLibrary.simpleMessage("No shorts available"),
    "noSubscriptions": MessageLookupByLibrary.simpleMessage("No Subscriptions"),
    "noSubscriptionsHint": MessageLookupByLibrary.simpleMessage(
      "Subscribe to channels to see their videos here",
    ),
    "noUploadDate": MessageLookupByLibrary.simpleMessage("No date"),
    "noUploaderName": MessageLookupByLibrary.simpleMessage("No name"),
    "noVideoAvailableChangedToHls": MessageLookupByLibrary.simpleMessage(
      "No video source available, automatically changed to hls",
    ),
    "noVideoDescription": MessageLookupByLibrary.simpleMessage(
      "No description",
    ),
    "noVideoTitle": MessageLookupByLibrary.simpleMessage("No title"),
    "noVideosFound": MessageLookupByLibrary.simpleMessage("No videos found"),
    "openInBrowser": MessageLookupByLibrary.simpleMessage("Open in Browser"),
    "openLinksExternally": MessageLookupByLibrary.simpleMessage(
      "Open links in external browser",
    ),
    "outro": MessageLookupByLibrary.simpleMessage("Outro"),
    "pauseOnCall": MessageLookupByLibrary.simpleMessage("Pause on Phone Call"),
    "pauseOnHeadphones": MessageLookupByLibrary.simpleMessage(
      "Pause on Headphone Disconnect",
    ),
    "pinned": MessageLookupByLibrary.simpleMessage("Pinned"),
    "playlist": MessageLookupByLibrary.simpleMessage("Playlist"),
    "playlists": MessageLookupByLibrary.simpleMessage("Playlists"),
    "profileInUse": MessageLookupByLibrary.simpleMessage("Active"),
    "profileName": MessageLookupByLibrary.simpleMessage("Profile Name"),
    "profiles": MessageLookupByLibrary.simpleMessage("Profiles"),
    "profilesDescription": MessageLookupByLibrary.simpleMessage(
      "Create separate profiles for different accounts or preferences",
    ),
    "quality1080p": MessageLookupByLibrary.simpleMessage("1080p"),
    "quality1440p": MessageLookupByLibrary.simpleMessage("1440p"),
    "quality144p": MessageLookupByLibrary.simpleMessage("144p"),
    "quality240p": MessageLookupByLibrary.simpleMessage("240p"),
    "quality360p": MessageLookupByLibrary.simpleMessage("360p"),
    "quality480p": MessageLookupByLibrary.simpleMessage("480p"),
    "quality720p": MessageLookupByLibrary.simpleMessage("720p"),
    "readMoreText": MessageLookupByLibrary.simpleMessage("Read more"),
    "recentSearches": MessageLookupByLibrary.simpleMessage("Recent searches"),
    "refreshToLoad": MessageLookupByLibrary.simpleMessage(
      "Pull down to refresh",
    ),
    "region": MessageLookupByLibrary.simpleMessage("Region"),
    "relatedTitle": MessageLookupByLibrary.simpleMessage("Related"),
    "removeFromHistory": MessageLookupByLibrary.simpleMessage(
      "Remove from history",
    ),
    "removeFromSaved": MessageLookupByLibrary.simpleMessage(
      "Remove from saved",
    ),
    "renameProfile": MessageLookupByLibrary.simpleMessage("Rename Profile"),
    "repliesNotSupported": MessageLookupByLibrary.simpleMessage(
      "Replies are not available yet",
    ),
    "repliesPlural": m1,
    "retrieveDislikeCounts": MessageLookupByLibrary.simpleMessage(
      "Retrieve dislike counts",
    ),
    "retrieveDislikes": MessageLookupByLibrary.simpleMessage(
      "Retrieve Dislikes",
    ),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "saved": MessageLookupByLibrary.simpleMessage("Saved"),
    "savedVideosTitle": MessageLookupByLibrary.simpleMessage("Saved Videos"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "searchFilters": MessageLookupByLibrary.simpleMessage("Filters"),
    "searchForVideosChannels": MessageLookupByLibrary.simpleMessage(
      "Search for videos, channels, and playlists",
    ),
    "searchHistoryEnabled": MessageLookupByLibrary.simpleMessage(
      "Save Search History",
    ),
    "searchHistoryEnabledDescription": MessageLookupByLibrary.simpleMessage(
      "Save your search queries for quick access",
    ),
    "searchSavedVideos": MessageLookupByLibrary.simpleMessage(
      "Search saved videos...",
    ),
    "searchSubscriptions": MessageLookupByLibrary.simpleMessage(
      "Search subscriptions...",
    ),
    "searchYouTube": MessageLookupByLibrary.simpleMessage("Search YouTube..."),
    "seconds": MessageLookupByLibrary.simpleMessage("seconds"),
    "selectAll": MessageLookupByLibrary.simpleMessage("Select all"),
    "selectFile": MessageLookupByLibrary.simpleMessage("Select File"),
    "selectVideos": MessageLookupByLibrary.simpleMessage("Select videos"),
    "selected": MessageLookupByLibrary.simpleMessage("selected"),
    "selfPromotion": MessageLookupByLibrary.simpleMessage("Self Promotion"),
    "serviceExplode": MessageLookupByLibrary.simpleMessage("Explode"),
    "serviceInvidious": MessageLookupByLibrary.simpleMessage("Invidious"),
    "serviceNewPipe": MessageLookupByLibrary.simpleMessage("NewPipe Extractor"),
    "servicePiped": MessageLookupByLibrary.simpleMessage("Piped"),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "share": MessageLookupByLibrary.simpleMessage("Share"),
    "shareVia": MessageLookupByLibrary.simpleMessage("Share via"),
    "shorts": MessageLookupByLibrary.simpleMessage("Shorts"),
    "showLessText": MessageLookupByLibrary.simpleMessage("Show less"),
    "showSearchHistory": MessageLookupByLibrary.simpleMessage(
      "Show Search History",
    ),
    "showSearchHistoryDescription": MessageLookupByLibrary.simpleMessage(
      "Display your recent searches in search screen",
    ),
    "skipInterval": MessageLookupByLibrary.simpleMessage("Skip Interval"),
    "skipIntervalDescription": MessageLookupByLibrary.simpleMessage(
      "Double-tap skip duration in seconds",
    ),
    "sort": MessageLookupByLibrary.simpleMessage("Sort"),
    "sortBy": MessageLookupByLibrary.simpleMessage("Sort by"),
    "sponsor": MessageLookupByLibrary.simpleMessage("Sponsor"),
    "sponsorBlock": MessageLookupByLibrary.simpleMessage("SponsorBlock"),
    "sponsorBlockCategories": MessageLookupByLibrary.simpleMessage(
      "Skip Categories",
    ),
    "sponsorBlockDescription": MessageLookupByLibrary.simpleMessage(
      "Skip sponsored segments automatically",
    ),
    "startSavingVideos": MessageLookupByLibrary.simpleMessage(
      "Start saving videos to watch later",
    ),
    "subscribe": MessageLookupByLibrary.simpleMessage("Subscribe"),
    "subscriptions": MessageLookupByLibrary.simpleMessage("Subscriptions"),
    "subtitleSize": MessageLookupByLibrary.simpleMessage("Subtitle Size"),
    "subtitleSizeDescription": MessageLookupByLibrary.simpleMessage(
      "Adjust the size of subtitles on video",
    ),
    "subtitleSizeExtraLarge": MessageLookupByLibrary.simpleMessage(
      "Extra Large",
    ),
    "subtitleSizeLarge": MessageLookupByLibrary.simpleMessage("Large"),
    "subtitleSizeMedium": MessageLookupByLibrary.simpleMessage("Medium"),
    "subtitleSizeSmall": MessageLookupByLibrary.simpleMessage("Small"),
    "swipeDownToDismissDisabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe down to dismiss\' disabled",
    ),
    "swipeUpToDismissEnabled": MessageLookupByLibrary.simpleMessage(
      "\'Swipe up to dismiss\' enabled",
    ),
    "switchProfile": MessageLookupByLibrary.simpleMessage("Switch Profile"),
    "switchRegion": MessageLookupByLibrary.simpleMessage(
      "Please consider switching to a different region for better results.",
    ),
    "theme": MessageLookupByLibrary.simpleMessage("Theme"),
    "themeDark": MessageLookupByLibrary.simpleMessage("Dark"),
    "themeLight": MessageLookupByLibrary.simpleMessage("Light"),
    "themeSystem": MessageLookupByLibrary.simpleMessage("System"),
    "thereIsNoSavedOrHistoryVideos": MessageLookupByLibrary.simpleMessage(
      "There are no saved/history videos",
    ),
    "thereIsNoSavedVideos": MessageLookupByLibrary.simpleMessage(
      "There are no saved videos",
    ),
    "title": MessageLookupByLibrary.simpleMessage("Title"),
    "translators": MessageLookupByLibrary.simpleMessage("Translators"),
    "trending": MessageLookupByLibrary.simpleMessage("Trending"),
    "unitedKingdom": MessageLookupByLibrary.simpleMessage("United Kingdom"),
    "unitedStates": MessageLookupByLibrary.simpleMessage("United States"),
    "unknown": MessageLookupByLibrary.simpleMessage("unknown"),
    "unknownQuality": MessageLookupByLibrary.simpleMessage("Unknown Quality"),
    "unsubscribe": MessageLookupByLibrary.simpleMessage("Unsubscribe"),
    "unsubscribeConfirm": MessageLookupByLibrary.simpleMessage(
      "Unsubscribe from this channel?",
    ),
    "version": MessageLookupByLibrary.simpleMessage("Version"),
    "video": MessageLookupByLibrary.simpleMessage("Video"),
    "videoFit": MessageLookupByLibrary.simpleMessage("Video Fit"),
    "videoFitContain": MessageLookupByLibrary.simpleMessage("Contain"),
    "videoFitCover": MessageLookupByLibrary.simpleMessage("Cover"),
    "videoFitFill": MessageLookupByLibrary.simpleMessage("Fill"),
    "videoFitFitHeight": MessageLookupByLibrary.simpleMessage("Fit Height"),
    "videoFitFitWidth": MessageLookupByLibrary.simpleMessage("Fit Width"),
    "videoViews": m2,
    "videos": MessageLookupByLibrary.simpleMessage("Videos"),
    "views": MessageLookupByLibrary.simpleMessage("views"),
    "watchSomeVideos": MessageLookupByLibrary.simpleMessage(
      "Videos you watch will appear here",
    ),
    "youtubeService": MessageLookupByLibrary.simpleMessage("YouTube Service"),
  };
}
