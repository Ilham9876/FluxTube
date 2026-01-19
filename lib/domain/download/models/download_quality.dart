/// Represents a video quality option for download
class VideoQualityOption {
  final String label;
  final String quality;
  final String? resolution;
  final int? bitrate;
  final String? codec;
  final int? fileSize;
  final String url;
  final bool isHls;
  final bool isMuxed; // Video+audio combined stream (no separate audio needed)

  const VideoQualityOption({
    required this.label,
    required this.quality,
    this.resolution,
    this.bitrate,
    this.codec,
    this.fileSize,
    required this.url,
    this.isHls = false,
    this.isMuxed = false,
  });

  String get formattedSize {
    if (fileSize == null) return '';
    if (fileSize! < 1024 * 1024) {
      return '${(fileSize! / 1024).toStringAsFixed(1)} KB';
    }
    return '${(fileSize! / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String get displayLabel {
    final parts = <String>[label];
    if (codec != null && codec!.isNotEmpty) {
      parts.add('($codec)');
    }
    if (fileSize != null) {
      parts.add('- $formattedSize');
    }
    return parts.join(' ');
  }
}

/// Represents an audio quality option for download
class AudioQualityOption {
  final String label;
  final int? bitrate;
  final String? codec;
  final int? fileSize;
  final String url;

  const AudioQualityOption({
    required this.label,
    this.bitrate,
    this.codec,
    this.fileSize,
    required this.url,
  });

  String get formattedSize {
    if (fileSize == null) return '';
    if (fileSize! < 1024 * 1024) {
      return '${(fileSize! / 1024).toStringAsFixed(1)} KB';
    }
    return '${(fileSize! / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String get displayLabel {
    final parts = <String>[label];
    if (bitrate != null) {
      parts.add('${bitrate}kbps');
    }
    if (codec != null && codec!.isNotEmpty) {
      parts.add('($codec)');
    }
    if (fileSize != null) {
      parts.add('- $formattedSize');
    }
    return parts.join(' ');
  }
}

/// Container for available download options
class DownloadOptions {
  final String videoId;
  final String title;
  final String channelName;
  final String? thumbnailUrl;
  final int? duration;
  final List<VideoQualityOption> videoQualities;
  final List<AudioQualityOption> audioQualities;

  const DownloadOptions({
    required this.videoId,
    required this.title,
    required this.channelName,
    this.thumbnailUrl,
    this.duration,
    required this.videoQualities,
    required this.audioQualities,
  });

  bool get hasVideoOptions => videoQualities.isNotEmpty;
  bool get hasAudioOptions => audioQualities.isNotEmpty;

  /// Get the best video quality option
  VideoQualityOption? get bestVideoQuality {
    if (videoQualities.isEmpty) return null;
    return videoQualities.first;
  }

  /// Get the best audio quality option
  AudioQualityOption? get bestAudioQuality {
    if (audioQualities.isEmpty) return null;
    return audioQualities.first;
  }
}
