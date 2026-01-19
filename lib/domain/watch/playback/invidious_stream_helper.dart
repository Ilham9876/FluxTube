import 'package:fluxtube/domain/watch/models/invidious/video/adaptive_format.dart';
import 'package:fluxtube/domain/watch/models/invidious/video/format_stream.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_stream.dart';

/// Helper class to convert Invidious stream models to NewPipe format for download compatibility.
/// Invidious uses:
/// - `adaptiveFormats` for separate video-only and audio-only streams (DASH)
/// - `formatStreams` for muxed video+audio streams
class InvidiousStreamHelper {
  /// Convert Invidious AdaptiveFormat list to NewPipe video-only streams.
  /// Filters for video streams only (type contains "video/").
  static List<NewPipeVideoStream> convertVideoStreams(List<AdaptiveFormat>? formats) {
    if (formats == null || formats.isEmpty) {
      return [];
    }

    // Filter only video streams
    final videoFormats = formats.where((f) =>
      f.type != null && f.type!.contains('video/')
    ).toList();

    return videoFormats.map((format) {
      // Parse resolution from size (e.g., "1920x1080") or qualityLabel
      int? width;
      int? height;
      if (format.size != null && format.size!.contains('x')) {
        final parts = format.size!.split('x');
        if (parts.length == 2) {
          width = int.tryParse(parts[0]);
          height = int.tryParse(parts[1]);
        }
      }

      return NewPipeVideoStream(
        url: format.url,
        resolution: format.qualityLabel ?? format.resolution,
        format: format.container,
        mimeType: format.type,
        codec: format.encoding,
        quality: format.qualityLabel,
        width: width,
        height: height,
        fps: format.fps,
        isVideoOnly: true, // AdaptiveFormat video streams are always video-only
        itag: int.tryParse(format.itag ?? ''),
        contentLength: int.tryParse(format.clen ?? ''),
        bitrate: int.tryParse(format.bitrate ?? ''),
      );
    }).toList();
  }

  /// Convert Invidious AdaptiveFormat list to NewPipe audio streams.
  /// Filters for audio streams only (type contains "audio/").
  static List<NewPipeAudioStream> convertAudioStreams(List<AdaptiveFormat>? formats) {
    if (formats == null || formats.isEmpty) {
      return [];
    }

    // Filter only audio streams
    final audioFormats = formats.where((f) =>
      f.type != null && f.type!.contains('audio/')
    ).toList();

    return audioFormats.map((format) {
      // Parse bitrate for quality label
      final bitrateKbps = int.tryParse(format.bitrate ?? '');
      final qualityLabel = format.audioQuality ??
          (bitrateKbps != null ? '${(bitrateKbps / 1000).round()}kbps' : null);

      return NewPipeAudioStream(
        url: format.url,
        averageBitrate: bitrateKbps != null ? bitrateKbps ~/ 1000 : null,
        format: format.container,
        mimeType: format.type,
        codec: format.encoding,
        quality: qualityLabel,
        itag: int.tryParse(format.itag ?? ''),
        contentLength: int.tryParse(format.clen ?? ''),
        bitrate: bitrateKbps,
        sampleRate: format.audioSampleRate,
        audioChannels: format.audioChannels,
      );
    }).toList();
  }

  /// Convert Invidious FormatStream list to NewPipe muxed video streams.
  /// FormatStreams are always muxed (video+audio combined).
  static List<NewPipeVideoStream> convertMuxedStreams(List<FormatStream>? formats) {
    if (formats == null || formats.isEmpty) {
      return [];
    }

    return formats.map((format) {
      // Parse resolution from size (e.g., "1920x1080")
      int? width;
      int? height;
      if (format.size != null && format.size!.contains('x')) {
        final parts = format.size!.split('x');
        if (parts.length == 2) {
          width = int.tryParse(parts[0]);
          height = int.tryParse(parts[1]);
        }
      } else if (format.resolution != null && format.resolution!.contains('x')) {
        final parts = format.resolution!.split('x');
        if (parts.length == 2) {
          width = int.tryParse(parts[0]);
          height = int.tryParse(parts[1]);
        }
      }

      return NewPipeVideoStream(
        url: format.url,
        resolution: format.qualityLabel ?? format.quality,
        format: format.container,
        mimeType: format.type,
        codec: format.encoding,
        quality: format.qualityLabel ?? format.quality,
        width: width,
        height: height,
        fps: format.fps,
        isVideoOnly: false, // FormatStreams are always muxed
        itag: int.tryParse(format.itag ?? ''),
        bitrate: int.tryParse(format.bitrate ?? ''),
      );
    }).toList();
  }
}
