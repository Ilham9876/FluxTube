import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_subtitle.dart';

part 'playback_configuration.freezed.dart';

/// Type of media source to use
enum MediaSourceType {
  /// Progressive download of muxed stream (has audio, ≤360p)
  progressive,

  /// Merging separate video and audio streams (>360p)
  merging,

  /// HLS stream (for live videos)
  hls,

  /// DASH manifest (adaptive streaming)
  dash,
}

/// Configuration for video playback
@freezed
class PlaybackConfiguration with _$PlaybackConfiguration {
  const factory PlaybackConfiguration({
    /// Type of media source
    required MediaSourceType sourceType,

    /// Quality label (e.g., "1080p", "720p 60fps")
    required String qualityLabel,

    /// Video URL (for progressive or merging)
    String? videoUrl,

    /// Audio URL (for merging only)
    String? audioUrl,

    /// Manifest URL (for HLS or DASH)
    String? manifestUrl,

    /// Subtitle tracks
    @Default([]) List<NewPipeSubtitle> subtitles,

    /// HTTP headers (if needed)
    @Default({}) Map<String, String> headers,

    /// Whether this is a live stream
    @Default(false) bool isLive,
  }) = _PlaybackConfiguration;

  const PlaybackConfiguration._();

  /// Check if configuration is valid
  bool get isValid {
    switch (sourceType) {
      case MediaSourceType.progressive:
        return videoUrl != null && videoUrl!.isNotEmpty;
      case MediaSourceType.merging:
        return videoUrl != null &&
            videoUrl!.isNotEmpty &&
            audioUrl != null &&
            audioUrl!.isNotEmpty;
      case MediaSourceType.hls:
      case MediaSourceType.dash:
        return manifestUrl != null && manifestUrl!.isNotEmpty;
    }
  }
}
