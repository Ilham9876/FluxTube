import 'package:json_annotation/json_annotation.dart';

part 'newpipe_trending_resp.g.dart';

@JsonSerializable()
class NewPipeTrendingResp {
  final String? url;
  final String? name;
  final String? thumbnailUrl;
  final String? type;
  final String? uploaderName;
  final String? uploaderUrl;
  final String? uploaderAvatarUrl;
  final bool? uploaderVerified;
  final int? duration;
  final int? viewCount;
  final String? uploadDate;
  final bool? isLive;
  final bool? isShort;
  // Content availability: UNKNOWN, AVAILABLE, MEMBERSHIP, PAID, UPCOMING
  final String? contentAvailability;

  NewPipeTrendingResp({
    this.url,
    this.name,
    this.thumbnailUrl,
    this.type,
    this.uploaderName,
    this.uploaderUrl,
    this.uploaderAvatarUrl,
    this.uploaderVerified,
    this.duration,
    this.viewCount,
    this.uploadDate,
    this.isLive,
    this.isShort,
    this.contentAvailability,
  });

  factory NewPipeTrendingResp.fromJson(Map<String, dynamic> json) =>
      _$NewPipeTrendingRespFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeTrendingRespToJson(this);

  /// Extract video ID from URL
  String? get videoId {
    if (url == null) return null;
    final uri = Uri.tryParse(url!);
    if (uri == null) return null;
    return uri.queryParameters['v'] ?? uri.pathSegments.lastOrNull;
  }
}

@JsonSerializable()
class NewPipeTrendingListResp {
  final List<NewPipeTrendingResp>? videos;
  final String? nextPage;

  NewPipeTrendingListResp({
    this.videos,
    this.nextPage,
  });

  factory NewPipeTrendingListResp.fromJson(Map<String, dynamic> json) =>
      _$NewPipeTrendingListRespFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeTrendingListRespToJson(this);
}
