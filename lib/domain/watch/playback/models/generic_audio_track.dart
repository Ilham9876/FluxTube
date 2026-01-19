/// Generic audio track info that can be used across different services (Piped, Invidious, etc.)
class GenericAudioTrackInfo {
  final String trackId;
  final String displayName;
  final String? locale;
  final bool isOriginal;
  final bool isDubbed;
  final bool isDescriptive;
  final String? url;
  final int? bitrate;
  final String? format;

  const GenericAudioTrackInfo({
    required this.trackId,
    required this.displayName,
    this.locale,
    this.isOriginal = false,
    this.isDubbed = false,
    this.isDescriptive = false,
    this.url,
    this.bitrate,
    this.format,
  });

  @override
  String toString() => 'GenericAudioTrackInfo(trackId: $trackId, displayName: $displayName)';
}
