import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_thumbnail.freezed.dart';
part 'image_thumbnail.g.dart';

/// Unified thumbnail model for all image references (video thumbnails, author thumbnails, banners)
///
/// This replaces the duplicate classes:
/// - VideoThumbnail (in search, channel, trending, watch)
/// - AuthorThumbnail (in channel, watch/video, watch/comments)
/// - AuthorBanner (in channel)
/// - ChannelThumbnail (in search)
@freezed
class ImageThumbnail with _$ImageThumbnail {
  const factory ImageThumbnail({
    String? url,
    int? width,
    int? height,
    /// Only used for video thumbnails (quality: default, medium, high, etc.)
    String? quality,
  }) = _ImageThumbnail;

  factory ImageThumbnail.fromJson(Map<String, dynamic> json) =>
      _$ImageThumbnailFromJson(json);
}

/// Helper extension to convert list of thumbnails
extension ImageThumbnailListExtension on List<ImageThumbnail> {
  /// Get the best quality thumbnail from the list
  ImageThumbnail? get best {
    if (isEmpty) return null;

    // Prefer high quality if available
    final highQuality = where((t) => t.quality == 'high' || t.quality == 'maxres').firstOrNull;
    if (highQuality != null) return highQuality;

    // Prefer medium quality
    final mediumQuality = where((t) => t.quality == 'medium').firstOrNull;
    if (mediumQuality != null) return mediumQuality;

    // Sort by width descending and return first
    final sorted = [...this]..sort((a, b) => (b.width ?? 0).compareTo(a.width ?? 0));
    return sorted.first;
  }

  /// Get the smallest thumbnail (for list views)
  ImageThumbnail? get smallest {
    if (isEmpty) return null;

    final defaultQuality = where((t) => t.quality == 'default').firstOrNull;
    if (defaultQuality != null) return defaultQuality;

    final sorted = [...this]..sort((a, b) => (a.width ?? 0).compareTo(b.width ?? 0));
    return sorted.first;
  }
}
