import 'package:json_annotation/json_annotation.dart';

part 'newpipe_stream.g.dart';

@JsonSerializable()
class NewPipeAudioStream {
  final String? url;
  final int? averageBitrate;
  final String? format;
  final String? mimeType;
  final String? codec;
  final String? quality;
  final String? id;
  final int? itag;
  // DASH manifest fields from ItagItem
  final int? initStart;
  final int? initEnd;
  final int? indexStart;
  final int? indexEnd;
  final int? contentLength;
  final int? bitrate;
  final int? approxDurationMs;
  final int? audioChannels;
  final int? sampleRate;
  // Audio track identification fields
  final String? audioTrackId;
  final String? audioTrackName;
  final String? audioTrackType; // ORIGINAL, DUBBED, DESCRIPTIVE
  final String? audioLocale;

  NewPipeAudioStream({
    this.url,
    this.averageBitrate,
    this.format,
    this.mimeType,
    this.codec,
    this.quality,
    this.id,
    this.itag,
    this.initStart,
    this.initEnd,
    this.indexStart,
    this.indexEnd,
    this.contentLength,
    this.bitrate,
    this.approxDurationMs,
    this.audioChannels,
    this.sampleRate,
    this.audioTrackId,
    this.audioTrackName,
    this.audioTrackType,
    this.audioLocale,
  });

  /// Check if URL contains dubbed indicator in xtags parameter
  /// URL may contain: xtags=acont%3Ddubbed-auto%3Alang%3Den-US (decoded: acont=dubbed-auto:lang=en-US)
  bool get _urlIndicatesDubbed {
    if (url == null) return false;
    final decodedUrl = Uri.decodeFull(url!);
    // Check for dubbed indicators in xtags parameter
    return decodedUrl.contains('acont=dubbed') ||
           decodedUrl.contains('acont%3Ddubbed');
  }

  /// Check if this is the original audio track (not dubbed)
  /// Also checks URL xtags for dubbed indicators when audioTrackType is null
  bool get isOriginal {
    // If URL indicates dubbed, it's not original
    if (_urlIndicatesDubbed) return false;
    // If audioTrackType is explicitly set to DUBBED or DESCRIPTIVE, not original
    if (audioTrackType != null && audioTrackType!.toUpperCase() == 'DUBBED') return false;
    if (audioTrackType != null && audioTrackType!.toUpperCase() == 'DESCRIPTIVE') return false;
    // Otherwise, consider original if type is null, ORIGINAL, or explicitly marked
    return audioTrackType == null ||
           audioTrackType == 'ORIGINAL' ||
           audioTrackType!.toUpperCase() == 'ORIGINAL';
  }

  /// Check if this is a dubbed audio track
  /// Also checks URL xtags for dubbed indicators
  bool get isDubbed {
    // Check URL for dubbed indicator first (more reliable when audioTrackType is null)
    if (_urlIndicatesDubbed) return true;
    // Then check audioTrackType field
    return audioTrackType != null &&
           audioTrackType!.toUpperCase() == 'DUBBED';
  }

  /// Check if this is a descriptive audio track
  bool get isDescriptive =>
      audioTrackType != null &&
      audioTrackType!.toUpperCase() == 'DESCRIPTIVE';

  /// Check if this stream has valid DASH segment info
  bool get hasDashInfo =>
      initStart != null &&
      initEnd != null &&
      indexStart != null &&
      indexEnd != null &&
      initEnd! >= 0 &&
      indexEnd! >= 0;

  factory NewPipeAudioStream.fromJson(Map<String, dynamic> json) =>
      _$NewPipeAudioStreamFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeAudioStreamToJson(this);
}

@JsonSerializable()
class NewPipeVideoStream {
  final String? url;
  final String? resolution;
  final String? format;
  final String? mimeType;
  final String? codec;
  final String? quality;
  final int? width;
  final int? height;
  final int? fps;
  final bool? isVideoOnly;
  final String? id;
  final int? itag;
  // DASH manifest fields from ItagItem
  final int? initStart;
  final int? initEnd;
  final int? indexStart;
  final int? indexEnd;
  final int? contentLength;
  final int? bitrate;
  final int? approxDurationMs;

  NewPipeVideoStream({
    this.url,
    this.resolution,
    this.format,
    this.mimeType,
    this.codec,
    this.quality,
    this.width,
    this.height,
    this.fps,
    this.isVideoOnly,
    this.id,
    this.itag,
    this.initStart,
    this.initEnd,
    this.indexStart,
    this.indexEnd,
    this.contentLength,
    this.bitrate,
    this.approxDurationMs,
  });

  /// Check if this stream has valid DASH segment info
  bool get hasDashInfo =>
      initStart != null &&
      initEnd != null &&
      indexStart != null &&
      indexEnd != null &&
      initEnd! >= 0 &&
      indexEnd! >= 0;

  factory NewPipeVideoStream.fromJson(Map<String, dynamic> json) =>
      _$NewPipeVideoStreamFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeVideoStreamToJson(this);
}
