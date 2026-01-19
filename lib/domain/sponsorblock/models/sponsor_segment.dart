/// Represents a SponsorBlock segment that should be skipped
class SponsorSegment {
  final String uuid;
  final double startTime;
  final double endTime;
  final String category;
  final String actionType;

  const SponsorSegment({
    required this.uuid,
    required this.startTime,
    required this.endTime,
    required this.category,
    this.actionType = 'skip',
  });

  factory SponsorSegment.fromJson(Map<String, dynamic> json) {
    final segment = json['segment'] as List<dynamic>;
    return SponsorSegment(
      uuid: json['UUID'] as String? ?? '',
      startTime: (segment[0] as num).toDouble(),
      endTime: (segment[1] as num).toDouble(),
      category: json['category'] as String? ?? 'sponsor',
      actionType: json['actionType'] as String? ?? 'skip',
    );
  }

  /// Duration of the segment in seconds
  double get duration => endTime - startTime;

  /// Check if a given position (in seconds) is within this segment
  bool containsPosition(double positionSeconds) {
    return positionSeconds >= startTime && positionSeconds < endTime;
  }

  /// Human-readable category name for display
  String get categoryDisplayName {
    switch (category) {
      case 'sponsor':
        return 'Sponsor';
      case 'selfpromo':
        return 'Self Promotion';
      case 'interaction':
        return 'Interaction Reminder';
      case 'intro':
        return 'Intro';
      case 'outro':
        return 'Outro';
      case 'preview':
        return 'Preview';
      case 'music_offtopic':
        return 'Non-Music Section';
      case 'filler':
        return 'Filler';
      default:
        return category;
    }
  }

  @override
  String toString() {
    return 'SponsorSegment(category: $category, ${startTime.toStringAsFixed(1)}s - ${endTime.toStringAsFixed(1)}s)';
  }
}
