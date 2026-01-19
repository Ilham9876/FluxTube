//--------DOWNLOAD ITEM MODEL--------//
// Domain model for download items

/// Download status enum
enum DownloadStatus {
  pending,
  downloading,
  paused,
  completed,
  failed,
  cancelled,
  merging,
}

/// Download type enum
enum DownloadType {
  videoOnly,
  audioOnly,
  videoWithAudio, // Muxed/merged
}

class DownloadItem {
  int? id;

  /// Unique video ID from YouTube
  late String videoId;

  /// Profile name for multi-profile support
  late String profileName;

  /// Video title
  late String title;

  /// Channel name
  late String channelName;

  /// Thumbnail URL
  String? thumbnailUrl;

  /// Video duration in seconds
  int? duration;

  /// Selected video quality (e.g., "720p", "1080p")
  String? videoQuality;

  /// Selected audio quality (e.g., "128kbps", "256kbps")
  String? audioQuality;

  /// Download type
  late DownloadType downloadType;

  /// Current download status
  late DownloadStatus status;

  /// Video stream URL
  String? videoUrl;

  /// Audio stream URL
  String? audioUrl;

  /// Downloaded video file path (temporary during download)
  String? videoFilePath;

  /// Downloaded audio file path (temporary during download)
  String? audioFilePath;

  /// Final output file path after merging
  String? outputFilePath;

  /// File size in bytes (total expected)
  int? totalBytes;

  /// Video file size in bytes
  int? videoTotalBytes;

  /// Audio file size in bytes
  int? audioTotalBytes;

  /// Downloaded bytes (current stream)
  int downloadedBytes = 0;

  /// Video downloaded bytes
  int videoDownloadedBytes = 0;

  /// Audio downloaded bytes
  int audioDownloadedBytes = 0;

  /// Download speed in bytes per second
  int downloadSpeed = 0;

  /// Estimated time remaining in seconds
  int? etaSeconds;

  /// Current download phase for video+audio downloads
  /// 'video' = downloading video, 'audio' = downloading audio, 'merging' = merging
  String? currentPhase;

  /// Error message if download failed
  String? errorMessage;

  /// Retry count
  int retryCount = 0;

  /// Created timestamp
  late DateTime createdAt;

  /// Started timestamp
  DateTime? startedAt;

  /// Completed timestamp
  DateTime? completedAt;

  /// Video download progress (0.0 to 1.0)
  double videoProgress = 0.0;

  /// Audio download progress (0.0 to 1.0)
  double audioProgress = 0.0;

  /// Overall progress (0.0 to 1.0)
  double get progress {
    if (downloadType == DownloadType.videoOnly) {
      return videoProgress;
    } else if (downloadType == DownloadType.audioOnly) {
      return audioProgress;
    } else {
      // For video with audio, weight video as 70% and audio as 30%
      return (videoProgress * 0.7) + (audioProgress * 0.3);
    }
  }

  /// Check if download is active
  bool get isActive =>
      status == DownloadStatus.downloading || status == DownloadStatus.merging;

  /// Check if download can be resumed
  bool get canResume =>
      status == DownloadStatus.paused || status == DownloadStatus.failed;

  /// Check if download can be paused
  bool get canPause => status == DownloadStatus.downloading;

  /// Get formatted file size
  String get formattedTotalSize {
    if (totalBytes == null) return 'Unknown';
    return _formatBytes(totalBytes!);
  }

  /// Get formatted downloaded size
  String get formattedDownloadedSize {
    return _formatBytes(downloadedBytes);
  }

  /// Get formatted download speed
  String get formattedSpeed {
    if (downloadSpeed == 0) return '';
    return '${_formatBytes(downloadSpeed)}/s';
  }

  /// Get formatted ETA
  String get formattedEta {
    if (etaSeconds == null || etaSeconds == 0) return '';
    final minutes = etaSeconds! ~/ 60;
    final seconds = etaSeconds! % 60;
    if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    }
    return '${seconds}s';
  }

  String _formatBytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
  }

  /// Create a new download item
  static DownloadItem create({
    required String videoId,
    required String title,
    required String channelName,
    required DownloadType downloadType,
    String profileName = 'default',
    String? thumbnailUrl,
    int? duration,
    String? videoQuality,
    String? audioQuality,
    String? videoUrl,
    String? audioUrl,
    int? totalBytes,
  }) {
    return DownloadItem()
      ..videoId = videoId
      ..profileName = profileName
      ..title = title
      ..channelName = channelName
      ..thumbnailUrl = thumbnailUrl
      ..duration = duration
      ..videoQuality = videoQuality
      ..audioQuality = audioQuality
      ..downloadType = downloadType
      ..status = DownloadStatus.pending
      ..videoUrl = videoUrl
      ..audioUrl = audioUrl
      ..totalBytes = totalBytes
      ..createdAt = DateTime.now();
  }

  /// Create a copy of this download item (for state updates)
  DownloadItem copy() {
    return DownloadItem()
      ..id = id
      ..videoId = videoId
      ..profileName = profileName
      ..title = title
      ..channelName = channelName
      ..thumbnailUrl = thumbnailUrl
      ..duration = duration
      ..videoQuality = videoQuality
      ..audioQuality = audioQuality
      ..downloadType = downloadType
      ..status = status
      ..videoUrl = videoUrl
      ..audioUrl = audioUrl
      ..videoFilePath = videoFilePath
      ..audioFilePath = audioFilePath
      ..outputFilePath = outputFilePath
      ..totalBytes = totalBytes
      ..videoTotalBytes = videoTotalBytes
      ..audioTotalBytes = audioTotalBytes
      ..downloadedBytes = downloadedBytes
      ..videoDownloadedBytes = videoDownloadedBytes
      ..audioDownloadedBytes = audioDownloadedBytes
      ..downloadSpeed = downloadSpeed
      ..etaSeconds = etaSeconds
      ..currentPhase = currentPhase
      ..errorMessage = errorMessage
      ..retryCount = retryCount
      ..createdAt = createdAt
      ..startedAt = startedAt
      ..completedAt = completedAt
      ..videoProgress = videoProgress
      ..audioProgress = audioProgress;
  }
}
