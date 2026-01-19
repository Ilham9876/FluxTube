/// Generic quality info model for all video services (non-NewPipe)
class GenericQualityInfo {
  final String label;
  final String displayLabel;
  final int resolution;
  final int? fps;
  final String? format;
  final String? url;

  GenericQualityInfo({
    required this.label,
    required this.displayLabel,
    required this.resolution,
    this.fps,
    this.format,
    this.url,
  });

  /// Parse resolution from quality string like "720p" or "1080p60"
  static int parseResolution(String quality) {
    final match = RegExp(r'(\d+)').firstMatch(quality);
    return match != null ? int.parse(match.group(1)!) : 0;
  }

  /// Parse FPS from quality string if present
  static int? parseFps(String quality) {
    // Check for formats like "1080p60" or "720p30"
    final match = RegExp(r'\d+p(\d+)').firstMatch(quality);
    if (match != null) {
      return int.parse(match.group(1)!);
    }
    return null;
  }
}
