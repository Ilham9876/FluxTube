import 'package:json_annotation/json_annotation.dart';
import 'package:fluxtube/domain/search/models/invidious/video_thumbnail.dart';

part 'invidious_playlist_resp.g.dart';

/// Invidious API Playlist Response Model
/// `flutter pub run build_runner build` to generate file
@JsonSerializable()
class InvidiousPlaylistResp {
  String? type;
  String? title;
  String? playlistId;
  String? playlistThumbnail;
  String? author;
  String? authorId;
  String? authorUrl;
  List<AuthorThumbnail>? authorThumbnails;
  String? description;
  String? descriptionHtml;
  int? videoCount;
  int? viewCount;
  int? updated;
  bool? isListed;
  List<InvidiousPlaylistVideo>? videos;

  InvidiousPlaylistResp({
    this.type,
    this.title,
    this.playlistId,
    this.playlistThumbnail,
    this.author,
    this.authorId,
    this.authorUrl,
    this.authorThumbnails,
    this.description,
    this.descriptionHtml,
    this.videoCount,
    this.viewCount,
    this.updated,
    this.isListed,
    this.videos,
  });

  factory InvidiousPlaylistResp.fromJson(Map<String, dynamic> json) =>
      _$InvidiousPlaylistRespFromJson(json);

  Map<String, dynamic> toJson() => _$InvidiousPlaylistRespToJson(this);
}

@JsonSerializable()
class InvidiousPlaylistVideo {
  String? title;
  String? videoId;
  String? author;
  String? authorId;
  String? authorUrl;
  List<VideoThumbnail>? videoThumbnails;
  int? index;
  int? lengthSeconds;

  InvidiousPlaylistVideo({
    this.title,
    this.videoId,
    this.author,
    this.authorId,
    this.authorUrl,
    this.videoThumbnails,
    this.index,
    this.lengthSeconds,
  });

  factory InvidiousPlaylistVideo.fromJson(Map<String, dynamic> json) =>
      _$InvidiousPlaylistVideoFromJson(json);

  Map<String, dynamic> toJson() => _$InvidiousPlaylistVideoToJson(this);
}

@JsonSerializable()
class AuthorThumbnail {
  String? url;
  int? width;
  int? height;

  AuthorThumbnail({this.url, this.width, this.height});

  factory AuthorThumbnail.fromJson(Map<String, dynamic> json) =>
      _$AuthorThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorThumbnailToJson(this);
}
