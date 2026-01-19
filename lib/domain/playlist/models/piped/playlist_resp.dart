import 'package:json_annotation/json_annotation.dart';
import 'playlist_video.dart';

part 'playlist_resp.g.dart';

/// Piped API Playlist Response Model
/// `flutter pub run build_runner build` to generate file
@JsonSerializable()
class PlaylistResp {
  String? name;
  String? thumbnailUrl;
  String? bannerUrl;
  String? nextpage;
  String? uploader;
  String? uploaderUrl;
  String? uploaderAvatar;
  int? videos;
  List<PlaylistVideo>? relatedStreams;

  PlaylistResp({
    this.name,
    this.thumbnailUrl,
    this.bannerUrl,
    this.nextpage,
    this.uploader,
    this.uploaderUrl,
    this.uploaderAvatar,
    this.videos,
    this.relatedStreams,
  });

  factory PlaylistResp.fromJson(Map<String, dynamic> json) =>
      _$PlaylistRespFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistRespToJson(this);
}
