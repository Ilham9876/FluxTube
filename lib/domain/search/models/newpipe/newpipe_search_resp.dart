import 'package:json_annotation/json_annotation.dart';

part 'newpipe_search_resp.g.dart';

@JsonSerializable()
class NewPipeSearchResp {
  final List<NewPipeSearchItem>? items;
  final String? nextPage;
  final String? searchSuggestion;
  final bool? isCorrectedSearch;

  NewPipeSearchResp({
    this.items,
    this.nextPage,
    this.searchSuggestion,
    this.isCorrectedSearch,
  });

  factory NewPipeSearchResp.fromJson(Map<String, dynamic> json) =>
      _$NewPipeSearchRespFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeSearchRespToJson(this);
}

@JsonSerializable()
class NewPipeSearchItem {
  final String? url;
  final String? name;
  final String? thumbnailUrl;
  final String? type; // STREAM, CHANNEL, PLAYLIST
  // Video/Stream fields
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
  // Channel fields
  final int? subscriberCount;
  final bool? isVerified;
  final String? description;
  // Playlist fields
  final int? streamCount;

  NewPipeSearchItem({
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
    this.subscriberCount,
    this.isVerified,
    this.description,
    this.streamCount,
  });

  factory NewPipeSearchItem.fromJson(Map<String, dynamic> json) =>
      _$NewPipeSearchItemFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeSearchItemToJson(this);

  /// Extract video ID from URL
  String? get videoId {
    if (url == null) return null;
    final uri = Uri.tryParse(url!);
    if (uri == null) return null;
    return uri.queryParameters['v'] ?? uri.pathSegments.lastOrNull;
  }

  /// Extract channel ID from URL
  String? get channelId {
    if (url == null) return null;
    final uri = Uri.tryParse(url!);
    if (uri == null) return null;
    if (uri.pathSegments.contains('channel')) {
      final idx = uri.pathSegments.indexOf('channel');
      if (idx + 1 < uri.pathSegments.length) {
        return uri.pathSegments[idx + 1];
      }
    }
    return null;
  }
}
