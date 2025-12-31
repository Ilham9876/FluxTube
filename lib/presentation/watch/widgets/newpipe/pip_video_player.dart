import 'dart:async';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_watch_resp.dart';
import 'package:fluxtube/generated/l10n.dart';

import '../../../../domain/saved/models/local_store.dart';
import '../../../routes/app_routes.dart'; // For global router

class NewPipePipVideoPlayerWidget extends StatefulWidget {
  const NewPipePipVideoPlayerWidget({
    super.key,
    required this.watchInfo,
    required this.videoId,
    required this.playbackPosition,
    this.defaultQuality = "720p",
    this.isSaved = false,
    this.isHlsPlayer = false,
    required this.watchState,
  });

  final NewPipeWatchResp watchInfo;
  final String videoId;
  final String defaultQuality;
  final int playbackPosition;
  final bool isSaved;
  final bool isHlsPlayer;
  final WatchState watchState;

  @override
  State<NewPipePipVideoPlayerWidget> createState() =>
      _NewPipePipVideoPlayerWidgetState();
}

class _NewPipePipVideoPlayerWidgetState
    extends State<NewPipePipVideoPlayerWidget> with TickerProviderStateMixin {
  BetterPlayerController? _betterPlayerController;

  NewPipeVideoStream? selectedVideoTrack;
  NewPipeAudioStream? selectedAudioTrack;
  late List<NewPipeVideoStream> availableVideoTracks;
  Map<String, String>? resolutions;

  late final double videoAspectRatio;
  late SavedBloc _savedBloc;
  List<BetterPlayerSubtitlesSource>? betterPlayerSubtitles;
  BetterPlayerDataSource? betterPlayerDataSource;

  WatchBloc? _watchBloc;
  Timer? _historyUpdateTimer;

  // Animation controllers
  late AnimationController _entryAnimationController;
  late AnimationController _springAnimationController;
  late AnimationController _scaleAnimationController;
  late AnimationController _glowAnimationController;
  late AnimationController _dismissAnimationController;

  // Animations
  late Animation<double> _entryScaleAnimation;
  late Animation<double> _entryOpacityAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  // Position and drag state
  Offset _position = Offset.zero;
  bool _isDragging = false;
  bool _isClosing = false;
  bool _showControls = true;

  // Screen boundaries
  late double _maxWidth;
  late double _maxHeight;

  // Constants
  static const double _playerWidth = 280.0;
  static const double _playerHeight = 158.0;
  static const double _padding = 16.0;
  static const double _cornerRadius = 16.0;
  static const Duration _historyUpdateInterval = Duration(seconds: 5);
  static const Duration _controlsHideDelay = Duration(seconds: 3);

  Timer? _controlsTimer;

  @override
  void initState() {
    super.initState();

    _savedBloc = BlocProvider.of<SavedBloc>(context);

    // Initialize animation controllers
    _entryAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _springAnimationController = AnimationController(
      vsync: this,
    );

    _scaleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _glowAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _dismissAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Setup animations
    _entryScaleAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(
        parent: _entryAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    _entryOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _entryAnimationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: _scaleAnimationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _glowAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // Initialize video
    videoAspectRatio = _selectAspectRatio();
    _fetchSubtitles();

    // Use only muxed video streams (have audio included)
    // Video-only streams don't have audio and BetterPlayer can't merge separate audio
    availableVideoTracks = [
      ...(widget.watchInfo.videoStreams ?? []),
    ];

    // Select best audio stream (kept for future use if player supports it)
    selectedAudioTrack = _selectBestAudioTrack();

    _buildResolutionsMap();
    selectedVideoTrack = _selectVideoTrack();
    _setupPlayer(widget.playbackPosition);

    // Start entry animation after frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      _maxWidth = size.width - _playerWidth - _padding;
      _maxHeight = size.height - _playerHeight - _padding - 100;

      // Start from bottom right corner
      setState(() {
        _position = Offset(_maxWidth, _maxHeight);
      });

      _entryAnimationController.forward();
      _startControlsTimer();
    });

    _setupHistoryUpdateTimer();
  }

  void _setupHistoryUpdateTimer() {
    _historyUpdateTimer?.cancel();
    _historyUpdateTimer = Timer.periodic(
      _historyUpdateInterval,
      (_) => _updateVideoHistory(),
    );
  }

  void _startControlsTimer() {
    _controlsTimer?.cancel();
    _controlsTimer = Timer(_controlsHideDelay, () {
      if (mounted && !_isDragging) {
        setState(() => _showControls = false);
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _watchBloc = BlocProvider.of<WatchBloc>(context);
  }

  @override
  void didUpdateWidget(covariant NewPipePipVideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If video ID changed, dispose the old player and reinitialize
    if (oldWidget.videoId != widget.videoId) {
      _betterPlayerController?.dispose(forceDispose: true);
      _betterPlayerController = null;
      availableVideoTracks = [
        ...(widget.watchInfo.videoStreams ?? []),
      ];
      selectedAudioTrack = _selectBestAudioTrack();
      _buildResolutionsMap();
      selectedVideoTrack = _selectVideoTrack();
      _setupPlayer(widget.playbackPosition);
    }
  }

  @override
  void dispose() {
    _historyUpdateTimer?.cancel();
    _controlsTimer?.cancel();
    _updateVideoHistory();
    _watchBloc?.add(WatchEvent.togglePip(value: false));
    _betterPlayerController?.dispose(forceDispose: true);
    _entryAnimationController.dispose();
    _springAnimationController.dispose();
    _scaleAnimationController.dispose();
    _glowAnimationController.dispose();
    _dismissAnimationController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    _isDragging = true;
    _springAnimationController.stop();
    _scaleAnimationController.forward();
    setState(() => _showControls = true);
    _controlsTimer?.cancel();
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _position += details.delta;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    _isDragging = false;
    _scaleAnimationController.reverse();

    // Calculate velocity for physics simulation
    final pixelsPerSecond = details.velocity.pixelsPerSecond;

    // Snap to nearest edge with spring physics
    _animateToNearestEdge(pixelsPerSecond);
    _startControlsTimer();
  }

  void _animateToNearestEdge(Offset velocity) {
    // Determine target position (snap to nearest horizontal edge)
    final screenCenter = _maxWidth / 2;
    final currentCenter = _position.dx + _playerWidth / 2;

    double targetX;
    if (velocity.dx.abs() > 500) {
      // Fast swipe - go in swipe direction
      targetX = velocity.dx > 0 ? _maxWidth : _padding;
    } else {
      // Slow drag - snap to nearest edge
      targetX = currentCenter > screenCenter ? _maxWidth : _padding;
    }

    // Clamp Y position
    double targetY = _position.dy.clamp(_padding, _maxHeight);

    final target = Offset(targetX, targetY);

    // Spring simulation
    final spring = SpringDescription(
      mass: 1,
      stiffness: 300,
      damping: 25,
    );

    final simulationX = SpringSimulation(
      spring,
      _position.dx,
      target.dx,
      velocity.dx / 1000,
    );

    final simulationY = SpringSimulation(
      spring,
      _position.dy,
      target.dy,
      velocity.dy / 1000,
    );

    _springAnimationController.reset();

    late final AnimationStatusListener listener;
    listener = (status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _springAnimationController.removeStatusListener(listener);
      }
    };
    _springAnimationController.addStatusListener(listener);

    Ticker? ticker;
    ticker = createTicker((elapsed) {
      final t = elapsed.inMilliseconds / 1000.0;
      if (simulationX.isDone(t) && simulationY.isDone(t)) {
        ticker?.dispose();
        return;
      }

      if (mounted) {
        setState(() {
          _position = Offset(
            simulationX.x(t).clamp(_padding, _maxWidth),
            simulationY.x(t).clamp(_padding, _maxHeight),
          );
        });
      }
    });
    ticker.start();
  }

  void _onTap() {
    setState(() => _showControls = !_showControls);
    if (_showControls) {
      _startControlsTimer();
    }
  }

  Future<void> _closePip() async {
    if (_isClosing) return;
    _isClosing = true;

    _updateVideoHistory();

    // Animate out with scale and fade
    await _dismissAnimationController.forward();

    _betterPlayerController?.dispose(forceDispose: true);
    _watchBloc?.add(WatchEvent.togglePip(value: false));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _entryAnimationController,
        _scaleAnimationController,
        _glowAnimationController,
        _dismissAnimationController,
      ]),
      builder: (context, child) {
        final dismissProgress = _dismissAnimationController.value;
        final entryScale = _entryScaleAnimation.value;
        final entryOpacity = _entryOpacityAnimation.value;
        final dragScale = _scaleAnimation.value;
        final glowIntensity = _glowAnimation.value;

        final combinedScale =
            entryScale * dragScale * (1 - dismissProgress * 0.5);
        final combinedOpacity = entryOpacity * (1 - dismissProgress);

        return Positioned(
          left: _position.dx + (dismissProgress * 100),
          top: _position.dy + (dismissProgress * 50),
          child: Opacity(
            opacity: combinedOpacity.clamp(0.0, 1.0),
            child: Transform.scale(
              scale: combinedScale,
              child: Transform.rotate(
                angle: dismissProgress * 0.2,
                child: GestureDetector(
                  onPanStart: _onPanStart,
                  onPanUpdate: _onPanUpdate,
                  onPanEnd: _onPanEnd,
                  onTap: _onTap,
                  child: _buildPlayerContainer(glowIntensity),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlayerContainer(double glowIntensity) {
    return Container(
      width: _playerWidth,
      height: _playerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_cornerRadius),
        boxShadow: [
          // Ambient shadow
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
          // Glow effect when playing
          if (_betterPlayerController?.isPlaying() == true)
            BoxShadow(
              color: Colors.indigo.withValues(alpha: 0.3 * glowIntensity),
              blurRadius: 30,
              spreadRadius: 5,
            ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_cornerRadius),
        child: Stack(
          children: [
            // Video player
            _buildVideoPlayer(),

            // Gradient overlay for controls visibility
            Positioned.fill(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: _showControls ? 1.0 : 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.5),
                        Colors.transparent,
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.5),
                      ],
                      stops: const [0.0, 0.3, 0.7, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            // Controls overlay
            if (_showControls) ...[
              // Top row: Expand and Close buttons
              Positioned(
                top: 8,
                left: 8,
                right: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildExpandButton(),
                    _buildCloseButton(),
                  ],
                ),
              ),

              // Play/pause button in center
              Center(
                child: _buildPlayPauseButton(),
              ),

              // Progress indicator
              Positioned(
                left: 12,
                right: 12,
                bottom: 8,
                child: _buildProgressIndicator(),
              ),
            ],

            // Drag indicator
            if (_isDragging)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_cornerRadius),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.5),
                      width: 2,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (widget.watchState.fetchNewPipeWatchInfoStatus == ApiStatus.loading) {
      return Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.indigo,
            strokeWidth: 2,
          ),
        ),
      );
    }

    if (_betterPlayerController != null) {
      // Wrap BetterPlayer with Navigator to provide proper context
      return Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) =>
              BetterPlayer(controller: _betterPlayerController!),
        ),
      );
    }

    return Container(
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.indigo,
          strokeWidth: 2,
        ),
      ),
    );
  }

  Widget _buildCloseButton() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Material(
            color: Colors.black.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: _closePip,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  CupertinoIcons.xmark,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildExpandButton() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Material(
            color: Colors.black.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: _expandToWatchScreen,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  CupertinoIcons.arrow_up_left_arrow_down_right,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _expandToWatchScreen() async {
    debugPrint('PiP: _expandToWatchScreen called, _isClosing=$_isClosing');
    if (_isClosing) {
      debugPrint('PiP: Already closing, returning early');
      return;
    }
    _isClosing = true;

    _updateVideoHistory();

    // Get the channel ID from uploader URL
    final channelId = _extractChannelId(widget.watchInfo.uploaderUrl) ?? '';
    final videoId = widget.videoId;
    debugPrint('PiP: Expanding to watch screen - videoId=$videoId, channelId=$channelId');

    // Pause the player first to stop rendering
    _betterPlayerController?.pause();

    // Disable PiP (this will trigger widget removal and dispose)
    _watchBloc?.add(WatchEvent.togglePip(value: false));

    // Wait for the PiP to be dismissed
    await Future.delayed(const Duration(milliseconds: 100));

    debugPrint('PiP: Navigating to watch screen now');
    // Navigate to the watch screen using the global router
    // (GlobalPipOverlay is outside the GoRouter widget tree, so we can't use GoRouter.of(context))
    router.goNamed('watch', pathParameters: {
      'videoId': videoId,
      'channelId': channelId,
    });
  }

  Widget _buildPlayPauseButton() {
    final isPlaying = _betterPlayerController?.isPlaying() == true;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Material(
            color: Colors.black.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                if (isPlaying) {
                  _betterPlayerController?.pause();
                } else {
                  _betterPlayerController?.play();
                }
                setState(() {});
                _startControlsTimer();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(
                      turns: Tween(begin: 0.5, end: 1.0).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: Icon(
                    isPlaying
                        ? CupertinoIcons.pause_fill
                        : CupertinoIcons.play_fill,
                    key: ValueKey(isPlaying),
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressIndicator() {
    return StreamBuilder<Duration?>(
      stream: Stream.periodic(const Duration(milliseconds: 500), (_) {
        return _betterPlayerController?.videoPlayerController?.value.position;
      }),
      builder: (context, snapshot) {
        final position = snapshot.data ?? Duration.zero;
        final duration =
            _betterPlayerController?.videoPlayerController?.value.duration ??
                Duration.zero;

        final progress = duration.inMilliseconds > 0
            ? position.inMilliseconds / duration.inMilliseconds
            : 0.0;

        return ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor: Colors.white.withValues(alpha: 0.3),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.indigo),
            minHeight: 3,
          ),
        );
      },
    );
  }

  // Player setup methods (unchanged from original)
  double _selectAspectRatio() {
    final firstStream = widget.watchInfo.videoStreams?.firstOrNull;
    if (firstStream != null &&
        firstStream.width != null &&
        firstStream.height != null) {
      return firstStream.width! / firstStream.height!;
    }
    return 16 / 9;
  }

  void _fetchSubtitles() {
    final subtitles = widget.watchInfo.subtitles;
    if (subtitles != null && subtitles.isNotEmpty) {
      betterPlayerSubtitles = subtitles.map((sub) {
        return BetterPlayerSubtitlesSource(
          type: BetterPlayerSubtitlesSourceType.network,
          name: sub.languageCode ?? 'Unknown',
          urls: [sub.url ?? ''],
        );
      }).toList();
    }
  }

  void _buildResolutionsMap() {
    resolutions = {};

    // Combine muxed streams and video-only streams
    final List<NewPipeVideoStream> allTracks = [
      ...availableVideoTracks.where((v) => v.url != null),
      ...(widget.watchInfo.videoOnlyStreams ?? []).where((v) => v.url != null),
    ];

    allTracks.sort((a, b) {
      final aRes = int.tryParse(a.resolution?.replaceAll('p', '') ?? '0') ?? 0;
      final bRes = int.tryParse(b.resolution?.replaceAll('p', '') ?? '0') ?? 0;
      if (aRes != bRes) return bRes.compareTo(aRes);
      return (b.fps ?? 0).compareTo(a.fps ?? 0);
    });

    for (var stream in allTracks) {
      String label = _getQualityLabel(stream);
      // Mark video-only streams so user knows they have no audio
      if (stream.isVideoOnly == true) {
        label = '$label (no audio)';
      }
      if (!resolutions!.containsKey(label)) {
        resolutions![label] = stream.url!;
      }
    }
  }

  String _getQualityLabel(NewPipeVideoStream stream) {
    String label = stream.resolution ?? 'Unknown';
    if (stream.fps != null && stream.fps! > 30) {
      label += ' ${stream.fps}fps';
    }
    return label;
  }

  NewPipeVideoStream? _selectVideoTrack() {
    if (availableVideoTracks.isEmpty || widget.isHlsPlayer) return null;

    final defaultQualityValue =
        int.tryParse(widget.defaultQuality.replaceAll('p', '')) ?? 720;
    final allValidStreams = availableVideoTracks
        .where((v) => v.url != null && v.url!.isNotEmpty)
        .toList();

    if (allValidStreams.isEmpty) return null;

    for (var video in allValidStreams) {
      if (video.resolution == widget.defaultQuality) return video;
    }

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

  bool _isValidUrl(String? url) {
    if (url == null || url.isEmpty) return false;
    final uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.host.isNotEmpty;
  }

  /// Select the best audio stream based on format compatibility, original vs dubbed, and bitrate
  NewPipeAudioStream? _selectBestAudioTrack() {
    final audioStreams = widget.watchInfo.audioStreams;
    if (audioStreams == null || audioStreams.isEmpty) return null;

    // First, separate original and dubbed streams
    final originalStreams = audioStreams.where((s) => s.isOriginal).toList();
    final dubbedStreams = audioStreams.where((s) => s.isDubbed).toList();

    // Prefer original audio tracks
    final preferredStreams = originalStreams.isNotEmpty ? originalStreams :
                             (dubbedStreams.isNotEmpty ? dubbedStreams : audioStreams);

    debugPrint('PiP Audio track selection: ${originalStreams.length} original, ${dubbedStreams.length} dubbed, using ${preferredStreams.length} streams');

    // Sort by bitrate (higher is better)
    final sortedStreams = List<NewPipeAudioStream>.from(preferredStreams)
      ..sort((a, b) => (b.averageBitrate ?? 0).compareTo(a.averageBitrate ?? 0));

    // Prefer M4A/AAC for better compatibility, then OPUS/WEBM
    final m4aStreams = sortedStreams.where((s) =>
      s.mimeType?.contains('mp4') == true ||
      s.format?.toLowerCase() == 'm4a').toList();

    if (m4aStreams.isNotEmpty) {
      debugPrint('PiP Selected audio: ${m4aStreams.first.audioTrackType ?? "unknown"} - ${m4aStreams.first.audioTrackName ?? "no name"} - ${m4aStreams.first.averageBitrate}kbps');
      return m4aStreams.first;
    }

    // Fallback to highest bitrate stream
    debugPrint('PiP Selected audio: ${sortedStreams.first.audioTrackType ?? "unknown"} - ${sortedStreams.first.audioTrackName ?? "no name"} - ${sortedStreams.first.averageBitrate}kbps');
    return sortedStreams.first;
  }

  void _setupPlayer(int startPosition) {
    _betterPlayerController?.dispose();

    final bool isLive = widget.watchInfo.isLive == true;
    String? videoUrl;
    BetterPlayerVideoFormat videoFormat = BetterPlayerVideoFormat.other;

    // Priority: Live HLS > User HLS > Server DASH/HLS > muxed streams
    if (isLive && _isValidUrl(widget.watchInfo.hlsUrl)) {
      // Live streams: use HLS
      videoUrl = widget.watchInfo.hlsUrl;
      videoFormat = BetterPlayerVideoFormat.hls;
      debugPrint('PiP: Using HLS for live stream');
    } else if (widget.isHlsPlayer && _isValidUrl(widget.watchInfo.hlsUrl)) {
      // User explicitly requested HLS player
      videoUrl = widget.watchInfo.hlsUrl;
      videoFormat = BetterPlayerVideoFormat.hls;
      debugPrint('PiP: Using HLS (user requested)');
    } else if (_isValidUrl(widget.watchInfo.dashMpdUrl)) {
      // DASH MPD from server - adaptive streaming with audio
      videoUrl = widget.watchInfo.dashMpdUrl;
      videoFormat = BetterPlayerVideoFormat.dash;
      debugPrint('PiP: Using server DASH MPD');
    } else if (_isValidUrl(widget.watchInfo.hlsUrl)) {
      // HLS - adaptive streaming with audio
      videoUrl = widget.watchInfo.hlsUrl;
      videoFormat = BetterPlayerVideoFormat.hls;
      debugPrint('PiP: Using HLS');
    } else if (selectedVideoTrack?.url != null &&
        _isValidUrl(selectedVideoTrack!.url)) {
      // Use muxed stream (has audio)
      videoUrl = selectedVideoTrack!.url;
      videoFormat = BetterPlayerVideoFormat.other;
      debugPrint('PiP: Using muxed stream: ${selectedVideoTrack!.resolution}');
    }

    if (videoUrl == null) {
      if (context.mounted) {
        WidgetsBinding.instance
            .addPostFrameCallback((_) => Fluttertoast.showToast(
                  msg: S.of(context).noVideoAvailableChangedToHls,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                ));
      }
      return;
    }

    // Only include resolutions for direct streams (non-DASH/HLS)
    final shouldIncludeResolutions =
        videoFormat == BetterPlayerVideoFormat.other &&
            resolutions != null &&
            resolutions!.isNotEmpty;

    betterPlayerDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoUrl,
      subtitles: betterPlayerSubtitles,
      liveStream: isLive,
      videoFormat: videoFormat,
      resolutions: shouldIncludeResolutions ? resolutions : null,
    );

    _betterPlayerController = BetterPlayerController(
      BetterPlayerConfiguration(
        controlsConfiguration: const BetterPlayerControlsConfiguration(
          showControls: false,
        ),
        autoPlay: true,
        startAt: isLive ? Duration.zero : Duration(seconds: startPosition),
        aspectRatio: 16 / 9,
        allowedScreenSleep: false,
        expandToFill: true,
        autoDispose: false,
        fit: BoxFit.cover,
      ),
      betterPlayerDataSource: betterPlayerDataSource,
    );

    if (mounted) setState(() {});
  }

  void _updateVideoHistory() async {
    final currentPosition =
        _betterPlayerController?.videoPlayerController?.value.position;
    if (currentPosition != null && widget.videoId.isNotEmpty) {
      _savedBloc.add(SavedEvent.addVideoInfo(
        videoInfo: LocalStoreVideoInfo(
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
        ),
      ));
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
