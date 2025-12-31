import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/domain/saved/models/local_store.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_watch_resp.dart';
import 'package:fluxtube/domain/watch/playback/models/playback_configuration.dart';
import 'package:fluxtube/domain/watch/playback/models/stream_quality_info.dart';
import 'package:fluxtube/domain/watch/playback/newpipe_playback_resolver.dart';
import 'package:fluxtube/domain/watch/playback/newpipe_stream_helper.dart';
import 'package:fluxtube/presentation/watch/widgets/player/player_controls_overlay.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class NewPipeMediaKitPlayer extends StatefulWidget {
  const NewPipeMediaKitPlayer({
    super.key,
    required this.watchInfo,
    required this.videoId,
    required this.playbackPosition,
    this.defaultQuality = "720p",
    this.isSaved = false,
    this.videoFitMode = "contain",
    this.skipInterval = 10,
    this.isAudioFocusEnabled = true,
    this.subtitleSize = 18.0,
  });

  final NewPipeWatchResp watchInfo;
  final String videoId;
  final String defaultQuality;
  final int playbackPosition;
  final bool isSaved;
  final String videoFitMode;
  final int skipInterval;
  final bool isAudioFocusEnabled;
  final double subtitleSize;

  @override
  State<NewPipeMediaKitPlayer> createState() => _NewPipeMediaKitPlayerState();
}

class _NewPipeMediaKitPlayerState extends State<NewPipeMediaKitPlayer> {
  late Player _player;
  late VideoController _videoController;
  PlaybackConfiguration? _currentConfig;
  List<StreamQualityInfo>? _availableQualities;
  String? _currentQualityLabel;
  bool _isInitialized = false;

  late final SavedBloc _savedBloc;
  late final WatchBloc _watchBloc;
  late final NewPipePlaybackResolver _resolver;

  @override
  void initState() {
    super.initState();

    _savedBloc = BlocProvider.of<SavedBloc>(context);
    _watchBloc = BlocProvider.of<WatchBloc>(context);
    _resolver = NewPipePlaybackResolver();

    _player = Player();
    _videoController = VideoController(_player);

    _initializePlayback();
    _setupHistoryListener();
  }

  Future<void> _initializePlayback() async {
    try {
      // Get available qualities
      _availableQualities =
          NewPipeStreamHelper.getAvailableQualities(widget.watchInfo);

      // Determine initial quality
      String targetQuality = widget.defaultQuality;

      // Check if preferred quality is available
      final hasPreferredQuality =
          _availableQualities?.any((q) => q.label == targetQuality) ?? false;
      if (!hasPreferredQuality && (_availableQualities?.isNotEmpty ?? false)) {
        // Use closest available quality
        targetQuality = _findClosestQuality(targetQuality);
      }

      _currentQualityLabel = targetQuality;

      // Resolve playback configuration
      _currentConfig = _resolver.resolve(
        watchResp: widget.watchInfo,
        preferredQuality: targetQuality,
        preferHighQuality: true,
      );

      debugPrint('=== MediaKit Playback Debug ===');
      debugPrint('Source type: ${_currentConfig!.sourceType}');
      debugPrint('Quality: ${_currentConfig!.qualityLabel}');
      debugPrint('Video URL: ${_currentConfig!.videoUrl}');
      debugPrint('Audio URL: ${_currentConfig!.audioUrl}');
      debugPrint('Manifest URL: ${_currentConfig!.manifestUrl}');
      debugPrint('Is valid: ${_currentConfig!.isValid}');

      if (!_currentConfig!.isValid) {
        _showError('No valid video stream available');
        return;
      }

      // Setup media source
      await _setupMediaSource(_currentConfig!);

      setState(() {
        _isInitialized = true;
      });
    } catch (e) {
      debugPrint('Error initializing playback: $e');
      _showError('Failed to initialize video playback');
    }
  }

  Future<void> _setupMediaSource(PlaybackConfiguration config) async {
    try {
      switch (config.sourceType) {
        case MediaSourceType.progressive:
          // Muxed stream (has audio, ≤360p)
          await _player.open(
            Media(
              config.videoUrl!,
              httpHeaders: {
                'User-Agent':
                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
              },
            ),
          );
          debugPrint('Opened progressive stream');
          break;

        case MediaSourceType.merging:
          // Separate video + audio (>360p)
          // Get fresh medium-quality audio URL for this quality change
          final audioUrl = _selectMediumQualityAudio();

          // First open video
          await _player.open(
            Media(
              config.videoUrl!,
              httpHeaders: {
                'User-Agent':
                    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
              },
            ),
            play: false,
          );

          // Wait a bit for video to be loaded before setting audio track
          await Future.delayed(const Duration(milliseconds: 100));

          if (audioUrl != null) {
            // Set audio track after video is opened and ready
            try {
              await _player.setAudioTrack(
                AudioTrack.uri(audioUrl),
              );
              debugPrint('Opened video + audio (${config.qualityLabel})');
              debugPrint('Video: ${config.videoUrl?.substring(0, 80)}...');
              debugPrint('Audio: ${audioUrl.substring(0, 80)}...');
            } catch (e) {
              debugPrint('Error setting audio track: $e');
            }
          } else {
            debugPrint('Warning: No audio URL available');
          }
          break;

        case MediaSourceType.hls:
          // Live HLS stream
          await _player.open(Media(config.manifestUrl!));
          debugPrint('Opened HLS stream');
          break;

        case MediaSourceType.dash:
          // DASH manifest
          await _player.open(Media(config.manifestUrl!));
          debugPrint('Opened DASH stream');
          break;
      }

      // Setup subtitles
      if (config.subtitles.isNotEmpty) {
        for (var subtitle in config.subtitles) {
          if (subtitle.url != null && subtitle.url!.isNotEmpty) {
            try {
              _player.setSubtitleTrack(
                SubtitleTrack.uri(subtitle.url!,
                    title: subtitle.languageCode ?? 'Unknown'),
              );
              debugPrint('Added subtitle: ${subtitle.languageCode}');
            } catch (e) {
              debugPrint('Failed to add subtitle: $e');
            }
          }
        }
      }

      // Seek to start position
      if (widget.playbackPosition > 0 && !config.isLive) {
        await _player.seek(Duration(seconds: widget.playbackPosition));
        debugPrint('Seeked to position: ${widget.playbackPosition}s');
      }

      // Start playback
      await _player.play();
      debugPrint('Started playback');
    } catch (e) {
      debugPrint('Error setting up media source: $e');
      _showError('Failed to load video');
    }
  }

  /// Select a medium-quality ORIGINAL audio stream (around 128kbps)
  /// Prioritizes original audio over dubbed/translated versions
  /// Returns fresh URL each time - needed because YouTube URLs expire
  String? _selectMediumQualityAudio() {
    final audioStreams = widget.watchInfo.audioStreams ?? [];
    if (audioStreams.isEmpty) return null;

    // Debug: Log all audio streams with URL-based detection
    debugPrint('=== Audio Stream Detection ===');
    for (var audio in audioStreams) {
      debugPrint('  - ${audio.quality} | ${audio.format} | type: ${audio.audioTrackType ?? "null"} | isOriginal: ${audio.isOriginal} | isDubbed: ${audio.isDubbed}');
    }
    debugPrint('==============================');

    // Filter to only original audio streams (not dubbed or descriptive)
    // Now also checks URL xtags for dubbed indicators when audioTrackType is null
    final originalStreams = audioStreams.where((audio) {
      if (audio.url == null || audio.url!.isEmpty) return false;
      return audio.isOriginal;
    }).toList();

    debugPrint('Audio filtering: ${originalStreams.length} original streams found out of ${audioStreams.length} total');

    // If no original streams found, fall back to all streams (excluding descriptive)
    final candidateStreams = originalStreams.isNotEmpty
        ? originalStreams
        : audioStreams.where((audio) {
            if (audio.url == null || audio.url!.isEmpty) return false;
            return !audio.isDescriptive;
          }).toList();

    if (candidateStreams.isEmpty) {
      // Last resort: use any available stream
      final anyValid = audioStreams.firstWhere(
        (audio) => audio.url != null && audio.url!.isNotEmpty,
        orElse: () => audioStreams.first,
      );
      debugPrint(
          'No suitable audio found, using fallback: ${anyValid.quality ?? "Unknown"}');
      return anyValid.url;
    }

    // Sort by quality
    final sorted = NewPipeStreamHelper.sortAudioStreams(candidateStreams);

    // Target medium quality (around 128kbps)
    // Find audio stream closest to 128kbps bitrate
    const targetBitrate = 128;
    NewPipeAudioStream? selectedAudio = sorted.first;
    int smallestDiff = double.maxFinite.toInt();

    for (var audio in sorted) {
      final bitrate = audio.averageBitrate ?? 0;
      final diff = (bitrate - targetBitrate).abs();

      if (diff < smallestDiff) {
        smallestDiff = diff;
        selectedAudio = audio;
      }
    }

    debugPrint(
        'Selected audio: ${selectedAudio?.quality ?? "Unknown"} | Bitrate: ${selectedAudio?.averageBitrate ?? 0}kbps | Format: ${selectedAudio?.format ?? "Unknown"} | TrackType: ${selectedAudio?.audioTrackType ?? "null"} | isOriginal: ${selectedAudio?.isOriginal} | isDubbed: ${selectedAudio?.isDubbed} | Locale: ${selectedAudio?.audioLocale ?? "N/A"}');
    return selectedAudio?.url;
  }

  String _findClosestQuality(String targetQuality) {
    if (_availableQualities == null || _availableQualities!.isEmpty) {
      return targetQuality;
    }

    // Parse target resolution
    final targetRes =
        int.tryParse(targetQuality.replaceAll(RegExp(r'[^\d]'), '')) ?? 720;

    // Find closest available quality
    StreamQualityInfo? closest = _availableQualities!.first;
    int smallestDiff = (closest.resolution - targetRes).abs();

    for (var quality in _availableQualities!) {
      final diff = (quality.resolution - targetRes).abs();
      if (diff < smallestDiff) {
        smallestDiff = diff;
        closest = quality;
      }
    }

    return closest?.label ?? targetQuality;
  }

  void _setupHistoryListener() {
    // Update history every 5 seconds
    _player.stream.position.listen((position) {
      if (position.inSeconds % 5 == 0) {
        _updateVideoHistory();
      }
    });
  }

  Future<void> changeQuality(String newQualityLabel) async {
    if (_currentQualityLabel == newQualityLabel) return;

    try {
      final currentPosition = _player.state.position;
      final wasPlaying = _player.state.playing;

      // Resolve new configuration (only video URL will be used, audio stays the same)
      final newConfig = _resolver.resolve(
        watchResp: widget.watchInfo,
        preferredQuality: newQualityLabel,
        preferHighQuality: true,
      );

      if (!newConfig.isValid) {
        _showError('Quality not available');
        return;
      }

      debugPrint('Changing quality to: $newQualityLabel (keeping fixed audio)');

      // Setup new source (will use fixed audio URL, only video changes)
      await _setupMediaSource(newConfig);

      // Restore position
      if (currentPosition.inSeconds > 0 && !newConfig.isLive) {
        await _player.seek(currentPosition);
      }

      // Restore playback state
      if (wasPlaying) {
        await _player.play();
      }

      setState(() {
        _currentConfig = newConfig;
        _currentQualityLabel = newQualityLabel;
      });

      _showToast('Quality changed to $newQualityLabel');
      debugPrint('Quality changed to: $newQualityLabel');
    } catch (e) {
      debugPrint('Error changing quality: $e');
      _showError('Failed to change quality');
    }
  }

  @override
  void dispose() {
    _updateVideoHistory();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized || _currentConfig == null) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: const Center(
            child: CircularProgressIndicator(color: Colors.white),
          ),
        ),
      );
    }

    return AspectRatio(
      aspectRatio: _getAspectRatio(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Video(
            controller: _videoController,
            controls: (state) {
              return _buildCustomControls(state);
            },
            fit: _getBoxFit(widget.videoFitMode),
            subtitleViewConfiguration: SubtitleViewConfiguration(
              style: TextStyle(
                fontSize: widget.subtitleSize,
                color: Colors.white,
                backgroundColor: const Color(0x99000000),
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            ),
          ),
          // Buffering indicator overlay
          StreamBuilder<bool>(
            stream: _player.stream.buffering,
            initialData: false,
            builder: (context, snapshot) {
              final isBuffering = snapshot.data ?? false;
              if (!isBuffering) return const SizedBox.shrink();
              return Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCustomControls(VideoState state) {
    return PlayerControlsOverlay(
      player: _player,
      videoState: state,
      availableQualities: _availableQualities,
      currentQuality: _currentQualityLabel,
      onQualityChanged: changeQuality,
      subtitles: _currentConfig?.subtitles ?? [],
      skipInterval: widget.skipInterval,
      isLive: widget.watchInfo.isLive == true,
    );
  }

  double _getAspectRatio() {
    final firstStream = widget.watchInfo.videoStreams?.firstOrNull;
    if (firstStream != null &&
        firstStream.width != null &&
        firstStream.height != null) {
      return firstStream.width! / firstStream.height!;
    }
    return 16 / 9;
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

  void _updateVideoHistory() {
    final currentPosition = _player.state.position;

    _watchBloc
        .add(WatchEvent.updatePlayBack(playBack: currentPosition.inSeconds));

    if (currentPosition.inSeconds > 0 && widget.videoId.isNotEmpty) {
      final videoInfo = LocalStoreVideoInfo(
        id: widget.videoId,
        title: widget.watchInfo.title,
        views: widget.watchInfo.viewCount,
        thumbnail: widget.watchInfo.thumbnailUrl,
        uploadedDate: widget.watchInfo.textualUploadDate ?? '',
        uploaderAvatar: widget.watchInfo.uploaderAvatarUrl,
        uploaderName: widget.watchInfo.uploaderName,
        uploaderId: _extractChannelId(widget.watchInfo.uploaderUrl),
        uploaderSubscriberCount:
            widget.watchInfo.uploaderSubscriberCount?.toString() ?? '0',
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

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void _showError(String message) {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showToast(message);
      });
    }
  }
}
