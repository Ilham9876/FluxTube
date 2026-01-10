import 'package:fluxtube/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:fluxtube/domain/watch/models/piped/video/audio_stream.dart';
import 'package:fluxtube/domain/watch/models/piped/video/video_stream.dart';

/// Helper class to convert Piped stream models to NewPipe format for download compatibility.
/// This allows the download system to work with Piped service using the existing NewPipe-based
/// download infrastructure.
class PipedStreamHelper {
  /// Convert Piped VideoStream list to NewPipe format.
  /// Piped videoStreams can contain both muxed (video+audio) and video-only streams,
  /// determined by the `videoOnly` field.
  static List<NewPipeVideoStream> convertVideoStreams(List<VideoStream>? streams) {
    if (streams == null || streams.isEmpty) {
      return [];
    }

    return streams.map((stream) {
      return NewPipeVideoStream(
        url: stream.url,
        resolution: stream.quality, // e.g., "720p", "1080p"
        format: stream.format,
        mimeType: stream.mimeType,
        codec: stream.codec,
        quality: stream.quality,
        width: stream.width,
        height: stream.height,
        fps: stream.fps,
        isVideoOnly: stream.videoOnly ?? false,
        itag: stream.itag,
        initStart: stream.initStart,
        initEnd: stream.initEnd,
        indexStart: stream.indexStart,
        indexEnd: stream.indexEnd,
        contentLength: stream.contentLength,
        bitrate: stream.bitrate,
      );
    }).toList();
  }

  /// Convert Piped AudioStream list to NewPipe format.
  static List<NewPipeAudioStream> convertAudioStreams(List<AudioStream>? streams) {
    if (streams == null || streams.isEmpty) {
      return [];
    }

    return streams.map((stream) {
      return NewPipeAudioStream(
        url: stream.url,
        averageBitrate: stream.bitrate,
        format: stream.format,
        mimeType: stream.mimeType,
        codec: stream.codec,
        quality: stream.quality,
        itag: stream.itag,
        initStart: stream.initStart,
        initEnd: stream.initEnd,
        indexStart: stream.indexStart,
        indexEnd: stream.indexEnd,
        contentLength: stream.contentLength,
        bitrate: stream.bitrate,
        audioTrackId: stream.audioTrackId?.toString(),
        audioTrackName: stream.audioTrackName?.toString(),
        audioTrackType: stream.audioTrackType?.toString(),
        audioLocale: stream.audioTrackLocale?.toString(),
      );
    }).toList();
  }

  /// Separate video streams into muxed (video+audio) and video-only lists.
  /// This matches how NewPipe separates videoStreams (muxed) from videoOnlyStreams.
  static ({List<NewPipeVideoStream> muxed, List<NewPipeVideoStream> videoOnly})
      separateVideoStreams(List<VideoStream>? streams) {
    if (streams == null || streams.isEmpty) {
      return (muxed: [], videoOnly: []);
    }

    final converted = convertVideoStreams(streams);
    final muxed = converted.where((s) => s.isVideoOnly != true).toList();
    final videoOnly = converted.where((s) => s.isVideoOnly == true).toList();

    return (muxed: muxed, videoOnly: videoOnly);
  }
}
