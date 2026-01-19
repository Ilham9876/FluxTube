import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/player/global_player_controller.dart';
import 'package:fluxtube/presentation/routes/app_routes.dart';
import 'package:media_kit_video/media_kit_video.dart';

/// A draggable Picture-in-Picture video overlay widget
class PipVideoWidget extends StatefulWidget {
  const PipVideoWidget({
    super.key,
    required this.videoId,
    required this.channelId,
    required this.title,
    required this.thumbnailUrl,
    this.isVisible = true,
  });

  final String videoId;
  final String channelId;
  final String title;
  final String? thumbnailUrl;
  final bool isVisible;

  @override
  State<PipVideoWidget> createState() => _PipVideoWidgetState();
}

class _PipVideoWidgetState extends State<PipVideoWidget> {
  final GlobalPlayerController _globalPlayer = GlobalPlayerController();

  // Position for draggable
  Offset _position = const Offset(16, 100);
  bool _isDragging = false;

  // PiP dimensions
  static const double pipWidth = 180;
  static const double pipHeight = 101; // 16:9 aspect ratio

  @override
  Widget build(BuildContext context) {
    // If not visible, return an empty positioned widget to maintain tree position
    // This keeps the widget in the tree to preserve its state (position, etc.)
    if (!widget.isVisible) {
      return const Positioned(
        left: -1000,  // Off-screen to avoid any rendering
        top: -1000,
        child: SizedBox.shrink(),
      );
    }

    final screenSize = MediaQuery.of(context).size;

    // Don't render if screen is too small (e.g., in system PiP mode)
    // The in-app PiP doesn't make sense when the whole app is already in a tiny window
    if (screenSize.width < pipWidth + 50 || screenSize.height < pipHeight + 150) {
      return const SizedBox.shrink();
    }

    // Clamp position to screen bounds
    final maxX = (screenSize.width - pipWidth).clamp(0.0, double.infinity);
    final minY = MediaQuery.of(context).padding.top;
    final maxY = (screenSize.height - pipHeight - MediaQuery.of(context).padding.bottom - 80)
        .clamp(minY, double.infinity);

    final clampedX = _position.dx.clamp(0.0, maxX);
    final clampedY = _position.dy.clamp(minY, maxY);

    return Positioned(
      left: clampedX.toDouble(),
      top: clampedY.toDouble(),
      child: GestureDetector(
        onPanStart: (_) => setState(() => _isDragging = true),
        onPanUpdate: (details) {
          setState(() {
            _position = Offset(
              _position.dx + details.delta.dx,
              _position.dy + details.delta.dy,
            );
          });
        },
        onPanEnd: (_) => setState(() => _isDragging = false),
        onTap: _onTap,
        child: AnimatedScale(
          scale: _isDragging ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: Material(
            elevation: _isDragging ? 12 : 8,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: Container(
              width: pipWidth,
              height: pipHeight,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Video player
                  if (_globalPlayer.hasActivePlayer)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Video(
                        controller: _globalPlayer.videoController,
                        controls: NoVideoControls,
                        fit: BoxFit.cover,
                      ),
                    )
                  else if (widget.thumbnailUrl != null)
                    // Fallback to thumbnail
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        widget.thumbnailUrl!,
                        fit: BoxFit.cover,
                        width: pipWidth,
                        height: pipHeight,
                        errorBuilder: (_, __, ___) => Container(
                          color: Colors.grey[900],
                          child: const Icon(Icons.play_arrow, color: Colors.white54),
                        ),
                      ),
                    ),

                  // Close button
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: _closePip,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),

                  // Play/Pause button overlay
                  Positioned.fill(
                    child: Center(
                      child: StreamBuilder<bool>(
                        stream: _globalPlayer.player.stream.playing,
                        initialData: _globalPlayer.isPlaying,
                        builder: (context, snapshot) {
                          final isPlaying = snapshot.data ?? false;
                          return GestureDetector(
                            onTap: _togglePlayPause,
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.4),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                isPlaying ? Icons.pause : Icons.play_arrow,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Expand button
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: _onTap,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.fullscreen,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    // Navigate back to watch screen
    BlocProvider.of<WatchBloc>(context).add(WatchEvent.togglePip(value: false));
    _globalPlayer.exitPipMode();
    // Use global router directly since PiP widget is outside router context
    router.goNamed('watch', pathParameters: {
      'videoId': widget.videoId,
      'channelId': widget.channelId,
    });
  }

  void _togglePlayPause() {
    if (_globalPlayer.isPlaying) {
      _globalPlayer.player.pause();
    } else {
      _globalPlayer.player.play();
    }
  }

  void _closePip() {
    // Stop playback and close PiP
    _globalPlayer.stopAndClear();
    BlocProvider.of<WatchBloc>(context).add(WatchEvent.togglePip(value: false));
  }
}
