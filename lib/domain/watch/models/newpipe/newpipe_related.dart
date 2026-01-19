import 'package:json_annotation/json_annotation.dart';

part 'newpipe_related.g.dart';

@JsonSerializable()
class NewPipeRelatedStream {
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
  // Channel-specific fields
  final int? subscriberCount;
  final bool? isVerified;
  final String? description;
  // Playlist-specific fields
  final int? streamCount;
  final String? playlistUploaderName;
  final String? playlistUploaderUrl;

  NewPipeRelatedStream({
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
    this.playlistUploaderName,
    this.playlistUploaderUrl,
  });

  factory NewPipeRelatedStream.fromJson(Map<String, dynamic> json) =>
      _$NewPipeRelatedStreamFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeRelatedStreamToJson(this);
}
