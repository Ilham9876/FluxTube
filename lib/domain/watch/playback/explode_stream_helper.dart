import 'package:fluxtube/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';

/// Helper class to fetch and convert YouTube Explode streams to NewPipe format for download compatibility.
/// Unlike Piped and Invidious, Explode requires async calls to fetch stream manifests.
class ExplodeStreamHelper {
  /// Fetch all download streams for a video from YouTube Explode.
  /// Returns muxed, video-only, and audio-only streams converted to NewPipe format.
  static Future<({
    List<NewPipeVideoStream> videoStreams,
    List<NewPipeVideoStream> videoOnlyStreams,
    List<NewPipeAudioStream> audioStreams,
  })> getDownloadStreams(String videoId) async {
    final yt = YoutubeExplode();
    try {
      final manifest = await yt.videos.streamsClient.getManifest(videoId);

      // Convert muxed streams (video + audio combined, usually ≤720p)
      final videoStreams = manifest.muxed.map((stream) {
        return NewPipeVideoStream(
          url: stream.url.toString(),
          resolution: stream.qualityLabel,
          format: stream.container.name.toUpperCase(),
          mimeType: 'video/${stream.container.name}',
          codec: stream.videoCodec,
          quality: stream.qualityLabel,
          width: stream.videoResolution.width,
          height: stream.videoResolution.height,
          fps: stream.framerate.framesPerSecond.toInt(),
          isVideoOnly: false, // Muxed streams include audio
          itag: stream.tag,
          contentLength: stream.size.totalBytes.toInt(),
          bitrate: stream.bitrate.bitsPerSecond.toInt(),
        );
      }).toList();

      // Convert video-only streams (higher quality, need audio merge)
      final videoOnlyStreams = manifest.videoOnly.map((stream) {
        return NewPipeVideoStream(
          url: stream.url.toString(),
          resolution: stream.qualityLabel,
          format: stream.container.name.toUpperCase(),
          mimeType: 'video/${stream.container.name}',
          codec: stream.videoCodec,
          quality: stream.qualityLabel,
          width: stream.videoResolution.width,
          height: stream.videoResolution.height,
          fps: stream.framerate.framesPerSecond.toInt(),
          isVideoOnly: true,
          itag: stream.tag,
          contentLength: stream.size.totalBytes.toInt(),
          bitrate: stream.bitrate.bitsPerSecond.toInt(),
        );
      }).toList();

      // Convert audio-only streams
      final audioStreams = manifest.audioOnly.map((stream) {
        return NewPipeAudioStream(
          url: stream.url.toString(),
          averageBitrate: stream.bitrate.kiloBitsPerSecond.toInt(),
          format: stream.container.name.toUpperCase(),
          mimeType: 'audio/${stream.container.name}',
          codec: stream.audioCodec,
          quality: '${stream.bitrate.kiloBitsPerSecond.toInt()}kbps',
          itag: stream.tag,
          contentLength: stream.size.totalBytes.toInt(),
          bitrate: stream.bitrate.bitsPerSecond.toInt(),
        );
      }).toList();

      return (
        videoStreams: videoStreams,
        videoOnlyStreams: videoOnlyStreams,
        audioStreams: audioStreams,
      );
    } finally {
      yt.close();
    }
  }
}
