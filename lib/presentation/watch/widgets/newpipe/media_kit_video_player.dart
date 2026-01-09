import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/player/global_player_controller.dart';
import 'package:fluxtube/domain/saved/models/local_store.dart';
import 'package:fluxtube/domain/sponsorblock/models/sponsor_segment.dart';
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
    this.sponsorSegments = const [],
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
  final List<SponsorSegment> sponsorSegments;

  @override
  State<NewPipeMediaKitPlayer> createState() => _NewPipeMediaKitPlayerState();
}

class _NewPipeMediaKitPlayerState extends State<NewPipeMediaKitPlayer> {
  // Use global player controller for persistence across navigation
  final GlobalPlayerController _globalPlayer = GlobalPlayerController();

  // Local references for convenience
  Player get _player => _globalPlayer.player;
  VideoController get _videoController => _globalPlayer.videoController;

  PlaybackConfiguration? _currentConfig;
  List<StreamQualityInfo>? _availableQualities;
  String? _currentQualityLabel;
  bool _isInitialized = false;
  bool _isInitializing = false; // Guard against concurrent initializations
  bool _isRestoringFromPip = false;
  bool _isChangingQuality = false;
  bool _isSeekingToPosition = false; // Track initial seek to saved position
  bool _isInitialBuffering = true; // Track initial buffering phase
  late BoxFit _currentFitMode;

  // SponsorBlock
  StreamSubscription<Duration>? _sponsorBlockSubscription;
  final Set<String> _skippedSegments = {};

  late final SavedBloc _savedBloc;
  late final WatchBloc _watchBloc;
  late final NewPipePlaybackResolver _resolver;

  @override
  void initState() {
    super.initState();

    _savedBloc = BlocProvider.of<SavedBloc>(context);
    _watchBloc = BlocProvider.of<WatchBloc>(context);
    _resolver = NewPipePlaybackResolver();
    _currentFitMode = _getBoxFit(widget.videoFitMode);

    // Defer initialization to next frame to handle async operations properly
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _initializeAsync();
      }
    });
  }

  /// Async initialization - matches pattern used by other player widgets
  Future<void> _initializeAsync() async {
    // CRITICAL: Prevent concurrent initializations
    // Multiple BlocBuilder rebuilds can trigger initState multiple times
    if (_isInitializing) {
      debugPrint('[NewPipePlayer] Initialization already in progress, skipping');
      return;
    }
    _isInitializing = true;

    try {
      // Check if we're returning from PiP for the same video
      // Only restore if the player is actually in a stable playing state for this video
      _isRestoringFromPip = _globalPlayer.isPlayingVideo(widget.videoId);

      if (_isRestoringFromPip) {
        // Restore from PiP - set initialized immediately since player is already active
        debugPrint('[NewPipePlayer] Restoring from PiP for video ${widget.videoId}');
        _restoreFromPipSync();
      } else {
        // New video - initialize fresh
        debugPrint('[NewPipePlayer] Starting fresh initialization for video ${widget.videoId}');
        await _initializePlayback();
      }
      _setupHistoryListener();
      _setupSponsorBlockListener();
    } finally {
      _isInitializing = false;
    }
  }

  @override
  void didUpdateWidget(covariant NewPipeMediaKitPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If the video ID changed, reinitialize playback
    if (oldWidget.videoId != widget.videoId) {
      debugPrint('[NewPipePlayer] CRITICAL: Video ID changed from ${oldWidget.videoId} to ${widget.videoId}');
      debugPrint('[NewPipePlayer] IMMEDIATELY stopping old video');

      // CRITICAL: Stop both local and global player immediately
      _player.stop();
      _globalPlayer.stopAndClear();

      // Cancel old sponsor block subscription
      _sponsorBlockSubscription?.cancel();
      _skippedSegments.clear();
      // Reset state - also reset _isInitializing to allow new video init
      setState(() {
        _isInitialized = false;
        _isInitializing = false;
        _isRestoringFromPip = false;
        _isSeekingToPosition = false;
        _isInitialBuffering = true;
      });
      // Initialize new video using the guarded method
      _initializeAsync();
    }
    // If watchInfo was updated (same videoId but new data), update available qualities
    // This happens when BlocBuilder passes new watchInfo after API response
    else if (oldWidget.watchInfo != widget.watchInfo &&
             widget.watchInfo.videoStreams != null &&
             widget.watchInfo.videoStreams!.isNotEmpty) {
      debugPrint('[NewPipePlayer] watchInfo updated for same video, updating qualities');
      _availableQualities = NewPipeStreamHelper.getAvailableQualities(widget.watchInfo);
    }
  }

  /// Synchronous restore from PiP - no loading state needed since player is already playing
  void _restoreFromPipSync() {
    // Get available qualities for UI
    _availableQualities =
        NewPipeStreamHelper.getAvailableQualities(widget.watchInfo);
    _currentQualityLabel = widget.defaultQuality;

    // Resolve config for UI controls
    _currentConfig = _resolver.resolve(
      watchResp: widget.watchInfo,
      preferredQuality: widget.defaultQuality,
      preferHighQuality: true,
    );

    // Mark as initialized immediately - player is already playing
    _isInitialized = true;

    // Check if player is still buffering (e.g., went to PiP while loading)
    // If buffering, keep showing the loading indicator - StreamBuilder will clear it when done
    _isInitialBuffering = _player.state.buffering;

    // Exit PiP mode in background (don't await)
    _globalPlayer.exitPipMode();

    debugPrint('[NewPipePlayer] Restored from PiP successfully (sync), buffering: $_isInitialBuffering');
  }

  Future<void> _initializePlayback() async {
    try {
      // If global player was playing a different video (e.g., in PiP), stop it first
      if (_globalPlayer.hasActivePlayer && _globalPlayer.currentVideoId != widget.videoId) {
        debugPrint('[NewPipePlayer] Stopping previous video ${_globalPlayer.currentVideoId} to play ${widget.videoId}');
        await _globalPlayer.stopAndClear();
      }

      // Check mounted after async operation
      if (!mounted) {
        debugPrint('[NewPipePlayer] Widget disposed during initialization (after stopAndClear)');
        return;
      }

      // Ensure global player is initialized before use
      await _globalPlayer.ensureInitialized();

      // Check mounted after async operation
      if (!mounted) {
        debugPrint('[NewPipePlayer] Widget disposed during initialization (after ensureInitialized)');
        return;
      }

      // STRICT: Enforce that we're about to play the correct video
      // This is a critical safety check to prevent video mismatches
      await _globalPlayer.enforceVideoId(widget.videoId);

      // Check mounted after async operation
      if (!mounted) {
        debugPrint('[NewPipePlayer] Widget disposed during initialization (after enforceVideoId)');
        return;
      }

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

      // Check mounted after async operation
      if (!mounted) {
        debugPrint('[NewPipePlayer] Widget disposed during initialization (after setupMediaSource)');
        return;
      }

      // Update global player controller state for PiP support
      _globalPlayer.setCurrentVideoId(widget.videoId);

      // Check if widget is still mounted before calling setState
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing playback: $e');
      if (mounted) {
        _showError('Failed to initialize video playback');
      }
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

          // First open video - don't wait for ready here, just open
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
          debugPrint('Opening merging stream');

          // Check mounted after async operation
          if (!mounted) return;

          // Wait for initial buffering to stabilize
          await Future.delayed(const Duration(milliseconds: 300));

          // Check mounted after delay
          if (!mounted) return;

          if (audioUrl != null) {
            // Set audio track
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

          // Check mounted after async operation
          if (!mounted) return;

          // Wait for audio track to be attached before any seek/play
          await Future.delayed(const Duration(milliseconds: 200));
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

      // Check mounted after switch block
      if (!mounted) return;

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

      // Wait for player to be ready before playing
      await _waitForPlayerReady();

      // Check mounted after waiting for player
      if (!mounted) return;

      // Start playback first
      await _player.play();

      // Check mounted after play
      if (!mounted) return;

      // Seek AFTER playback has started to avoid codec recreation
      // The codec is already running and stable at this point
      if (widget.playbackPosition > 0 && !config.isLive) {
        // Small delay to let playback stabilize before seeking
        await Future.delayed(const Duration(milliseconds: 100));
        if (!mounted) return;

        await _player.seek(Duration(seconds: widget.playbackPosition));
        debugPrint('Seeked to position: ${widget.playbackPosition}s (after play)');
      }

      // Note: _isInitialBuffering will be cleared by StreamBuilder when buffering stops
      debugPrint('Started playback');
    } catch (e) {
      debugPrint('Error setting up media source: $e');
      if (mounted) {
        _showError('Failed to load video');
      }
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

  /// Wait for the player to be ready (duration > 0) with timeout
  Future<void> _waitForPlayerReady({Duration timeout = const Duration(seconds: 5)}) async {
    final startTime = DateTime.now();

    while (_player.state.duration == Duration.zero) {
      if (DateTime.now().difference(startTime) > timeout) {
        debugPrint('[Player] Timeout waiting for player ready, proceeding anyway');
        break;
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }

    debugPrint('[Player] Player ready, duration: ${_player.state.duration}');
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

  void _setupSponsorBlockListener() {
    if (widget.sponsorSegments.isEmpty) return;

    _sponsorBlockSubscription = _player.stream.position.listen((position) {
      final currentSeconds = position.inSeconds.toDouble() +
          (position.inMilliseconds % 1000) / 1000.0;

      for (final segment in widget.sponsorSegments) {
        // Check if we're within this segment and haven't skipped it yet
        if (segment.containsPosition(currentSeconds) &&
            !_skippedSegments.contains(segment.uuid)) {
          _skippedSegments.add(segment.uuid);

          // Seek to end of segment
          final seekPosition = Duration(
            milliseconds: (segment.endTime * 1000).round(),
          );
          _player.seek(seekPosition);

          // Show toast notification
          _showToast('Skipped ${segment.categoryDisplayName}');
          debugPrint(
              '[SponsorBlock] Skipped ${segment.category} segment: ${segment.startTime}s - ${segment.endTime}s');
          break;
        }
      }
    });
  }

  Future<void> changeQuality(String newQualityLabel) async {
    if (_currentQualityLabel == newQualityLabel) return;

    setState(() {
      _isChangingQuality = true;
    });

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
        setState(() {
          _isChangingQuality = false;
        });
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
        _isChangingQuality = false;
      });

      _showToast('Quality changed to $newQualityLabel');
      debugPrint('Quality changed to: $newQualityLabel');
    } catch (e) {
      debugPrint('Error changing quality: $e');
      _showError('Failed to change quality');
      setState(() {
        _isChangingQuality = false;
      });
    }
  }

  @override
  void dispose() {
    _sponsorBlockSubscription?.cancel();
    _updateVideoHistory();
    // Don't dispose the global player - save state for PiP transition
    // The player will persist and can be restored when returning from PiP
    _globalPlayer.savePlaybackState();
    debugPrint('[NewPipePlayer] Dispose called - saving state for potential PiP');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use StreamBuilder to react to player duration changes
    // This ensures we show loading until video is actually ready
    return StreamBuilder<Duration>(
      stream: _player.stream.duration,
      initialData: _player.state.duration,
      builder: (context, durationSnapshot) {
        // Show loading only for fresh initialization, not when restoring from PiP
        // Check if player is already active with loaded media to skip loading state
        // A video is "ready" when:
        // 1. ID matches AND
        // 2. Either duration > 0 (metadata loaded) OR position > 0 (has played)
        final duration = durationSnapshot.data ?? Duration.zero;
        final bool playerIsReady = _globalPlayer.currentVideoId == widget.videoId &&
            (duration.inSeconds > 0 || _player.state.position.inSeconds > 0);

        if (!_isInitialized && !playerIsReady) {
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

        // For controls, we need config - but we can still show video without it
        if (_currentConfig == null && !playerIsReady) {
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
            fit: _currentFitMode,
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
            initialData: true,
            builder: (context, bufferingSnapshot) {
              final isBuffering = bufferingSnapshot.data ?? false;

              // Auto-clear initial buffering flag when buffering stops
              if (!isBuffering && _isInitialBuffering && mounted) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && _isInitialBuffering && !_player.state.buffering) {
                    setState(() {
                      _isInitialBuffering = false;
                    });
                  }
                });
              }

              // Show loading for buffering, quality change, seeking, or initial load
              final shouldShowOverlay = isBuffering || _isChangingQuality || _isSeekingToPosition || _isInitialBuffering;
              if (!shouldShowOverlay) {
                return const SizedBox.shrink();
              }

              // Determine the message to show
              String? message;
              if (_isChangingQuality) {
                message = 'Changing quality...';
              } else if (_isSeekingToPosition || _isInitialBuffering) {
                // Show "Resuming playback..." if seeking, otherwise "Loading video..."
                message = widget.playbackPosition > 0 ? 'Resuming playback...' : 'Loading video...';
              }
              // For regular buffering (after initial load), just show spinner without message

              return Container(
                color: Colors.black.withValues(alpha: 0.3),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                      if (message != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
      },
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
      currentFitMode: _currentFitMode,
      onFitModeChanged: _onFitModeChanged,
    );
  }

  void _onFitModeChanged(BoxFit newFitMode) {
    setState(() {
      _currentFitMode = newFitMode;
    });
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
        // isSaved will be preserved by updatePlaybackPosition event
        isSaved: false,
        playbackPosition: currentPosition.inSeconds,
      );

      // Use updatePlaybackPosition instead of addVideoInfo to preserve isSaved state
      _savedBloc.add(SavedEvent.updatePlaybackPosition(videoInfo: videoInfo));
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
