import 'package:json_annotation/json_annotation.dart';

part 'playlist_video.g.dart';

/// Piped API Playlist Video Model
@JsonSerializable()
class PlaylistVideo {
  String? url;
  String? title;
  String? thumbnail;
  String? uploaderName;
  String? uploaderUrl;
  String? uploaderAvatar;
  String? uploadedDate;
  String? shortDescription;
  int? duration;
  int? views;
  int? uploaded;
  bool? uploaderVerified;
  bool? isShort;

  PlaylistVideo({
    this.url,
    this.title,
    this.thumbnail,
    this.uploaderName,
    this.uploaderUrl,
    this.uploaderAvatar,
    this.uploadedDate,
    this.shortDescription,
    this.duration,
    this.views,
    this.uploaded,
    this.uploaderVerified,
    this.isShort,
  });

  factory PlaylistVideo.fromJson(Map<String, dynamic> json) =>
      _$PlaylistVideoFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistVideoToJson(this);
}
