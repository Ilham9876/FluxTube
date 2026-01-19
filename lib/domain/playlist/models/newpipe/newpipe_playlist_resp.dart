import 'package:json_annotation/json_annotation.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_related.dart';

part 'newpipe_playlist_resp.g.dart';

@JsonSerializable()
class NewPipePlaylistResp {
  final String? id;
  final String? name;
  final String? thumbnailUrl;
  final String? uploaderName;
  final String? uploaderUrl;
  final String? uploaderAvatarUrl;
  final int? streamCount;
  final List<NewPipeRelatedStream>? videos;
  final String? nextPage;

  NewPipePlaylistResp({
    this.id,
    this.name,
    this.thumbnailUrl,
    this.uploaderName,
    this.uploaderUrl,
    this.uploaderAvatarUrl,
    this.streamCount,
    this.videos,
    this.nextPage,
  });

  factory NewPipePlaylistResp.fromJson(Map<String, dynamic> json) =>
      _$NewPipePlaylistRespFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipePlaylistRespToJson(this);
}
