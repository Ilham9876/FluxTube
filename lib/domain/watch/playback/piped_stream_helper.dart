import 'package:fluxtube/domain/watch/models/newpipe/newpipe_stream.dart';
import 'package:fluxtube/domain/watch/models/piped/video/audio_stream.dart';
import 'package:fluxtube/domain/watch/models/piped/video/video_stream.dart';
import 'package:fluxtube/domain/watch/playback/models/generic_audio_track.dart';

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

  /// Format preferences (best to worst) for audio
  static const List<String> _preferredAudioFormats = ['M4A', 'OPUS', 'WEBM', 'MP4'];

  /// Get all available audio tracks from audio streams
  /// Groups streams by audioTrackId/audioTrackLocale and returns best stream for each track
  static List<GenericAudioTrackInfo> getAvailableAudioTracks(
    List<AudioStream>? audioStreams,
  ) {
    if (audioStreams == null || audioStreams.isEmpty) return [];

    final trackMap = <String, List<AudioStream>>{};

    // Group streams by audio track identifier
    for (var stream in audioStreams) {
      if (stream.url == null || stream.url!.isEmpty) continue;

      // Use audioTrackId if available, otherwise fall back to locale or 'default'
      final trackId = _getTrackId(stream);
      trackMap.putIfAbsent(trackId, () => []).add(stream);
    }

    // Convert to GenericAudioTrackInfo list
    final tracks = <GenericAudioTrackInfo>[];

    for (var entry in trackMap.entries) {
      final streams = entry.value;
      if (streams.isEmpty) continue;

      // Sort streams by quality and get the best one
      final sortedStreams = _sortAudioStreamsByQuality(streams);
      final bestStream = sortedStreams.first;

      // Determine display name and track properties
      final trackType = bestStream.audioTrackType?.toString().toLowerCase() ?? '';
      final isOriginal = trackType.contains('original');
      final isDubbed = trackType.contains('dubbed') || trackType.contains('dub');
      final isDescriptive = trackType.contains('descriptive');

      String displayName;
      final trackName = bestStream.audioTrackName?.toString();
      final trackLocale = bestStream.audioTrackLocale?.toString();

      if (trackName != null && trackName.isNotEmpty && trackName != 'null') {
        displayName = trackName;
      } else if (trackLocale != null && trackLocale.isNotEmpty && trackLocale != 'null') {
        displayName = _getLanguageDisplayName(trackLocale);
      } else if (isOriginal) {
        displayName = 'Original';
      } else {
        displayName = 'Default';
      }

      // Add type suffix if dubbed or descriptive
      if (isDubbed && !displayName.toLowerCase().contains('dubbed')) {
        displayName += ' (Dubbed)';
      } else if (isDescriptive && !displayName.toLowerCase().contains('descriptive')) {
        displayName += ' (Descriptive)';
      }

      tracks.add(GenericAudioTrackInfo(
        trackId: entry.key,
        displayName: displayName,
        locale: trackLocale,
        isOriginal: isOriginal,
        isDubbed: isDubbed,
        isDescriptive: isDescriptive,
        url: bestStream.url,
        bitrate: bestStream.bitrate,
        format: bestStream.format,
      ));
    }

    // Sort: Non-dubbed first, then non-descriptive, then original, then alphabetically
    tracks.sort((a, b) {
      // Dubbed tracks go last
      if (a.isDubbed && !b.isDubbed) return 1;
      if (!a.isDubbed && b.isDubbed) return -1;

      // Descriptive tracks go after dubbed
      if (a.isDescriptive && !b.isDescriptive) return 1;
      if (!a.isDescriptive && b.isDescriptive) return -1;

      // Explicitly marked Original tracks come first
      if (a.isOriginal && !b.isOriginal) return -1;
      if (!a.isOriginal && b.isOriginal) return 1;

      // Then alphabetically by display name
      return a.displayName.compareTo(b.displayName);
    });

    return tracks;
  }

  /// Get best audio stream URL for a specific track ID
  static String? getBestAudioUrlForTrack(
    List<AudioStream>? audioStreams,
    String trackId,
  ) {
    if (audioStreams == null || audioStreams.isEmpty) return null;

    final trackStreams = audioStreams
        .where((s) => _getTrackId(s) == trackId && s.url != null && s.url!.isNotEmpty)
        .toList();

    if (trackStreams.isEmpty) return null;

    final sorted = _sortAudioStreamsByQuality(trackStreams);
    return sorted.first.url;
  }

  /// Get best audio stream (highest quality)
  static AudioStream? getBestAudioStream(List<AudioStream>? audioStreams) {
    if (audioStreams == null || audioStreams.isEmpty) return null;

    final validStreams = audioStreams
        .where((s) => s.url != null && s.url!.isNotEmpty)
        .toList();

    if (validStreams.isEmpty) return null;

    final sorted = _sortAudioStreamsByQuality(validStreams);
    return sorted.first;
  }

  /// Get best video-only stream for a target quality
  static VideoStream? getBestVideoOnlyStream(
    List<VideoStream>? videoStreams,
    String targetQuality,
  ) {
    if (videoStreams == null || videoStreams.isEmpty) return null;

    // Filter to video-only streams
    final videoOnlyStreams = videoStreams
        .where((v) => v.videoOnly == true && v.url != null && v.url!.isNotEmpty)
        .toList();

    if (videoOnlyStreams.isEmpty) return null;

    // Parse target resolution
    final targetRes = _parseResolution(targetQuality);

    // Try exact match first
    for (var stream in videoOnlyStreams) {
      final streamRes = _parseResolution(stream.quality);
      if (streamRes == targetRes) return stream;
    }

    // Find closest match
    VideoStream? closest;
    int smallestDiff = double.maxFinite.toInt();

    for (var stream in videoOnlyStreams) {
      final streamRes = _parseResolution(stream.quality);
      final diff = (streamRes - targetRes).abs();

      if (diff < smallestDiff) {
        smallestDiff = diff;
        closest = stream;
      }
    }

    return closest;
  }

  /// Check if video streams have video-only options (for stream merging)
  static bool hasVideoOnlyStreams(List<VideoStream>? videoStreams) {
    if (videoStreams == null || videoStreams.isEmpty) return false;
    return videoStreams.any((v) => v.videoOnly == true && v.url != null && v.url!.isNotEmpty);
  }

  /// Get track ID from audio stream
  static String _getTrackId(AudioStream stream) {
    final trackId = stream.audioTrackId?.toString();
    if (trackId != null && trackId.isNotEmpty && trackId != 'null') {
      return trackId;
    }

    final locale = stream.audioTrackLocale?.toString();
    if (locale != null && locale.isNotEmpty && locale != 'null') {
      return locale;
    }

    final trackType = stream.audioTrackType?.toString();
    if (trackType != null && trackType.toLowerCase().contains('original')) {
      return 'original';
    }

    return 'default';
  }

  /// Sort audio streams by quality
  static List<AudioStream> _sortAudioStreamsByQuality(List<AudioStream> streams) {
    final sorted = List<AudioStream>.from(streams);

    sorted.sort((a, b) {
      // 1. Bitrate (higher first)
      final aBitrate = a.bitrate ?? 0;
      final bBitrate = b.bitrate ?? 0;
      if (aBitrate != bBitrate) return bBitrate.compareTo(aBitrate);

      // 2. Format preference
      final aFormatIndex = _preferredAudioFormats.indexOf(a.format?.toUpperCase() ?? '');
      final bFormatIndex = _preferredAudioFormats.indexOf(b.format?.toUpperCase() ?? '');

      if (aFormatIndex >= 0 && bFormatIndex >= 0) {
        return aFormatIndex.compareTo(bFormatIndex);
      }

      if (aFormatIndex >= 0) return -1;
      if (bFormatIndex >= 0) return 1;

      return 0;
    });

    return sorted;
  }

  /// Parse resolution from string (e.g., "1080p" -> 1080)
  static int _parseResolution(String? resolution) {
    if (resolution == null) return 0;
    return int.tryParse(resolution.replaceAll(RegExp(r'[^\d]'), '')) ?? 0;
  }

  /// Convert locale code to display name
  static String _getLanguageDisplayName(String locale) {
    const languageNames = {
      'en': 'English',
      'en-US': 'English (US)',
      'en-GB': 'English (UK)',
      'es': 'Spanish',
      'es-ES': 'Spanish (Spain)',
      'es-MX': 'Spanish (Mexico)',
      'es-419': 'Spanish (Latin America)',
      'fr': 'French',
      'de': 'German',
      'it': 'Italian',
      'pt': 'Portuguese',
      'pt-BR': 'Portuguese (Brazil)',
      'ru': 'Russian',
      'ja': 'Japanese',
      'ko': 'Korean',
      'zh': 'Chinese',
      'zh-CN': 'Chinese (Simplified)',
      'zh-TW': 'Chinese (Traditional)',
      'hi': 'Hindi',
      'ar': 'Arabic',
      'tr': 'Turkish',
      'pl': 'Polish',
      'nl': 'Dutch',
      'sv': 'Swedish',
      'th': 'Thai',
      'vi': 'Vietnamese',
      'id': 'Indonesian',
      'ml': 'Malayalam',
      'ta': 'Tamil',
      'te': 'Telugu',
    };

    return languageNames[locale] ?? locale.toUpperCase();
  }
}
