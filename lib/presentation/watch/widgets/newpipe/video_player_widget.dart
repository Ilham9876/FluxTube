import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/domain/saved/models/local_store.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_watch_resp.dart';
import 'package:fluxtube/generated/l10n.dart';

class NewPipeVideoPlayerWidget extends StatefulWidget {
  const NewPipeVideoPlayerWidget({
    super.key,
    required this.watchInfo,
    required this.videoId,
    required this.playbackPosition,
    this.defaultQuality = "720p",
    this.isSaved = false,
    this.isHlsPlayer = false,
    this.videoFitMode = "contain",
    this.skipInterval = 10,
    this.isAudioFocusEnabled = true,
  });

  final NewPipeWatchResp watchInfo;
  final String videoId;
  final String defaultQuality;
  final int playbackPosition;
  final bool isSaved;
  final bool isHlsPlayer;
  final String videoFitMode;
  final int skipInterval;
  final bool isAudioFocusEnabled;

  @override
  State<NewPipeVideoPlayerWidget> createState() =>
      _NewPipeVideoPlayerWidgetState();
}

class _NewPipeVideoPlayerWidgetState extends State<NewPipeVideoPlayerWidget> {
  BetterPlayerController? _betterPlayerController;
  NewPipeVideoStream? selectedVideoTrack;
  NewPipeAudioStream? selectedAudioTrack;
  late final List<NewPipeVideoStream> availableVideoTracks;
  late final double aspectRatio;
  late final SavedBloc _savedBloc;
  late final WatchBloc _watchBloc;
  BetterPlayerDataSource? betterPlayerDataSource;
  Map<String, String>? resolutions;

  @override
  void initState() {
    super.initState();

    _savedBloc = BlocProvider.of<SavedBloc>(context);
    _watchBloc = BlocProvider.of<WatchBloc>(context);

    // Debug: Log available streams
    _logAvailableStreams();

    // Combine all video streams (muxed + video-only) for quality options
    availableVideoTracks = [
      ...(widget.watchInfo.videoStreams ?? []),
      ...(widget.watchInfo.videoOnlyStreams ?? []),
    ];

    // Select best audio stream for video-only playback
    selectedAudioTrack = _selectBestAudioTrack();

    // Build resolutions map including both muxed and video-only streams
    _buildResolutionsMap();

    aspectRatio = _selectAspectRatio();
    selectedVideoTrack = _selectVideoTrack();

    debugPrint('Selected video track: ${selectedVideoTrack?.resolution} | URL valid: ${_isValidUrl(selectedVideoTrack?.url)}');
    debugPrint('Selected audio track: ${selectedAudioTrack?.quality} | URL valid: ${_isValidUrl(selectedAudioTrack?.url)}');
    debugPrint('Resolutions map has ${resolutions?.length ?? 0} entries: ${resolutions?.keys.toList()}');

    _setupPlayer(widget.playbackPosition);
  }

  void _logAvailableStreams() {
    debugPrint('=== NewPipe Stream Debug ===');
    debugPrint('Muxed streams (videoStreams): ${widget.watchInfo.videoStreams?.length ?? 0}');
    for (var stream in widget.watchInfo.videoStreams ?? []) {
      debugPrint('  - ${stream.resolution} | ${stream.format} | URL valid: ${_isValidUrl(stream.url)}');
    }
    debugPrint('Video-only streams: ${widget.watchInfo.videoOnlyStreams?.length ?? 0}');
    for (var stream in widget.watchInfo.videoOnlyStreams ?? []) {
      debugPrint('  - ${stream.resolution} | ${stream.format} | URL valid: ${_isValidUrl(stream.url)}');
    }
    debugPrint('Audio streams: ${widget.watchInfo.audioStreams?.length ?? 0}');
    for (var stream in widget.watchInfo.audioStreams ?? []) {
      debugPrint('  - ${stream.quality} | ${stream.format} | ${stream.averageBitrate}kbps | URL valid: ${_isValidUrl(stream.url)}');
    }
    debugPrint('HLS URL valid: ${_isValidUrl(widget.watchInfo.hlsUrl)}');
    debugPrint('DASH MPD URL valid: ${_isValidUrl(widget.watchInfo.dashMpdUrl)}');
    debugPrint('=== End Stream Debug ===');
  }

  /// Select the best audio stream based on format compatibility and bitrate
  NewPipeAudioStream? _selectBestAudioTrack() {
    final audioStreams = widget.watchInfo.audioStreams;
    if (audioStreams == null || audioStreams.isEmpty) return null;

    // Sort by bitrate (higher is better)
    final sortedStreams = List<NewPipeAudioStream>.from(audioStreams)
      ..sort((a, b) => (b.averageBitrate ?? 0).compareTo(a.averageBitrate ?? 0));

    // Prefer M4A/AAC for better compatibility, then OPUS/WEBM
    final m4aStreams = sortedStreams.where((s) =>
      s.mimeType?.contains('mp4') == true ||
      s.format?.toLowerCase() == 'm4a').toList();

    if (m4aStreams.isNotEmpty) return m4aStreams.first;

    // Fallback to highest bitrate stream
    return sortedStreams.first;
  }

  /// Build resolutions map from all available streams
  void _buildResolutionsMap() {
    resolutions = {};

    // Get all valid tracks
    final allTracks = availableVideoTracks
        .where((v) => v.url != null)
        .toList();

    // Sort all tracks by resolution (highest first), then by fps
    allTracks.sort((a, b) {
      final aRes = int.tryParse(a.resolution?.replaceAll('p', '') ?? '0') ?? 0;
      final bRes = int.tryParse(b.resolution?.replaceAll('p', '') ?? '0') ?? 0;
      if (aRes != bRes) {
        return bRes.compareTo(aRes); // Higher resolution first
      }
      // Same resolution: higher fps first
      return (b.fps ?? 0).compareTo(a.fps ?? 0);
    });

    // Add to map (preserves insertion order)
    for (var stream in allTracks) {
      final label = _getQualityLabel(stream);
      // Only add if we don't already have this quality label
      if (!resolutions!.containsKey(label)) {
        resolutions![label] = stream.url!;
      }
    }
  }

  /// Get a display label for the quality (e.g., "1080p 60fps")
  String _getQualityLabel(NewPipeVideoStream stream) {
    String label = stream.resolution ?? 'Unknown';
    if (stream.fps != null && stream.fps! > 30) {
      label += ' ${stream.fps}fps';
    }
    return label;
  }

  @override
  void dispose() {
    _updateVideoHistory();
    _betterPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: _betterPlayerController != null
          ? BetterPlayer(controller: _betterPlayerController!)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  double _selectAspectRatio() {
    final firstStream = widget.watchInfo.videoStreams?.firstOrNull;
    if (firstStream != null && firstStream.width != null && firstStream.height != null) {
      return firstStream.width! / firstStream.height!;
    }
    return 16 / 9;
  }

  NewPipeVideoStream? _selectVideoTrack() {
    if (availableVideoTracks.isEmpty || widget.isHlsPlayer) {
      return null;
    }

    final defaultQualityValue =
        int.tryParse(widget.defaultQuality.replaceAll('p', '')) ?? 720;

    // Get all streams with valid URLs
    final allValidStreams = availableVideoTracks
        .where((v) => v.url != null && v.url!.isNotEmpty)
        .toList();

    if (allValidStreams.isEmpty) return null;

    // First, try to find exact match
    for (var video in allValidStreams) {
      if (video.resolution == widget.defaultQuality) {
        return video;
      }
    }

    // Find closest quality
    NewPipeVideoStream? defaultTrack;
    int smallestDifference = double.maxFinite.toInt();

    for (var track in allValidStreams) {
      int trackQualityValue =
          int.tryParse(track.resolution?.replaceAll('p', '') ?? '0') ?? 0;
      int difference = (trackQualityValue - defaultQualityValue).abs();

      if (difference < smallestDifference) {
        smallestDifference = difference;
        defaultTrack = track;
      }
    }

    return defaultTrack ?? allValidStreams.first;
  }

  void _setupPlayer(int startPosition) {
    String? videoUrl;
    BetterPlayerVideoFormat videoFormat = BetterPlayerVideoFormat.other;

    final bool isLive = widget.watchInfo.isLive == true;

    // For live streams, prefer HLS
    if (isLive && _isValidUrl(widget.watchInfo.hlsUrl)) {
      videoUrl = widget.watchInfo.hlsUrl;
      videoFormat = BetterPlayerVideoFormat.hls;
    } else if (widget.isHlsPlayer && _isValidUrl(widget.watchInfo.hlsUrl)) {
      // User explicitly requested HLS player
      videoUrl = widget.watchInfo.hlsUrl;
      videoFormat = BetterPlayerVideoFormat.hls;
    } else if (selectedVideoTrack?.url != null && _isValidUrl(selectedVideoTrack!.url)) {
      // Use direct stream with resolutions map for quality switching
      videoUrl = selectedVideoTrack!.url;
      videoFormat = BetterPlayerVideoFormat.other;
    } else if (_isValidUrl(widget.watchInfo.hlsUrl)) {
      // Fallback to HLS
      videoUrl = widget.watchInfo.hlsUrl;
      videoFormat = BetterPlayerVideoFormat.hls;
    }

    if (videoUrl == null) {
      _showNoVideoAvailableToast();
      return;
    }

    // Only include resolutions for direct streams (non-HLS)
    final shouldIncludeResolutions = videoFormat == BetterPlayerVideoFormat.other &&
        resolutions != null &&
        resolutions!.isNotEmpty;

    betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoUrl,
      subtitles: _createSubtitles(),
      liveStream: isLive,
      videoFormat: videoFormat,
      resolutions: shouldIncludeResolutions ? resolutions : null,
    );

    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        controlsConfiguration: BetterPlayerControlsConfiguration(
          controlBarColor: Colors.black26,
          iconsColor: Colors.white,
          playIcon: Icons.play_arrow_outlined,
          progressBarPlayedColor: Colors.indigo,
          progressBarHandleColor: Colors.indigo,
          controlBarHeight: 40,
          loadingColor: Colors.red,
          overflowModalColor: Colors.black54,
          overflowModalTextColor: Colors.white,
          overflowMenuIconsColor: Colors.white,
          skipForwardIcon: Icons.forward_10,
          skipBackIcon: Icons.replay_10,
          forwardSkipTimeInMilliseconds: widget.skipInterval * 1000,
          backwardSkipTimeInMilliseconds: widget.skipInterval * 1000,
        ),
        autoPlay: true,
        startAt: isLive ? Duration.zero : Duration(seconds: startPosition),
        aspectRatio: aspectRatio,
        allowedScreenSleep: false,
        expandToFill: false,
        autoDispose: true,
        fit: _getBoxFit(widget.videoFitMode),
        handleLifecycle: widget.isAudioFocusEnabled,
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );

    if (mounted) {
      setState(() {});
    }
  }

  /// Check if URL is valid and has a proper host
  bool _isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.host.isNotEmpty;
  }

  void _showNoVideoAvailableToast() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Fluttertoast.showToast(
        msg: S.of(context).noVideoAvailableChangedToHls,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    });
  }

  List<BetterPlayerSubtitlesSource>? _createSubtitles() {
    final subtitles = widget.watchInfo.subtitles;
    if (subtitles == null || subtitles.isEmpty) return null;

    return subtitles.map((sub) {
      return BetterPlayerSubtitlesSource(
        type: BetterPlayerSubtitlesSourceType.network,
        name: sub.languageCode ?? 'Unknown',
        urls: [sub.url ?? ''],
      );
    }).toList();
  }

  BoxFit _getBoxFit(String fitMode) {
    switch (fitMode) {
      case 'cover':
        return BoxFit.cover;
      case 'fill':
        return BoxFit.fill;
      case 'fitWidth':
        return BoxFit.fitWidth;
      case 'fitHeight':
        return BoxFit.fitHeight;
      case 'contain':
      default:
        return BoxFit.contain;
    }
  }

  void _updateVideoHistory() async {
    final currentPosition =
        _betterPlayerController?.videoPlayerController?.value.position;

    _watchBloc.add(WatchEvent.updatePlayBack(playBack: currentPosition?.inSeconds));

    if (currentPosition != null && widget.videoId.isNotEmpty) {
      final videoInfo = LocalStoreVideoInfo(
        id: widget.videoId,
        title: widget.watchInfo.title,
        views: widget.watchInfo.viewCount,
        thumbnail: widget.watchInfo.thumbnailUrl,
        uploadedDate: widget.watchInfo.textualUploadDate ?? '',
        uploaderAvatar: widget.watchInfo.uploaderAvatarUrl,
        uploaderName: widget.watchInfo.uploaderName,
        uploaderId: _extractChannelId(widget.watchInfo.uploaderUrl),
        uploaderSubscriberCount: widget.watchInfo.uploaderSubscriberCount?.toString() ?? '0',
        duration: widget.watchInfo.duration,
        uploaderVerified: widget.watchInfo.uploaderVerified,
        isHistory: true,
        isLive: widget.watchInfo.isLive,
        isSaved: widget.isSaved,
        playbackPosition: currentPosition.inSeconds,
      );

      _savedBloc.add(SavedEvent.addVideoInfo(videoInfo: videoInfo));
    }
  }

  String? _extractChannelId(String? uploaderUrl) {
    if (uploaderUrl == null) return null;
    final uri = Uri.tryParse(uploaderUrl);
    if (uri != null && uri.pathSegments.isNotEmpty) {
      final channelIndex = uri.pathSegments.indexOf('channel');
      if (channelIndex != -1 && channelIndex + 1 < uri.pathSegments.length) {
        return uri.pathSegments[channelIndex + 1];
      }
    }
    return null;
  }
}
