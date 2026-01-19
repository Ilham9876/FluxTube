import 'package:json_annotation/json_annotation.dart';

part 'related_stream.g.dart';

@JsonSerializable()
class RelatedStream {
  String? url;
  String? type;
  String? title;
  String? name;
  String? thumbnail;
  String? thumbnailUrl;
  String? uploaderName;
  String? uploaderUrl;
  dynamic uploaderAvatar;
  String? uploadedDate;
  String? shortDescription;
  int? duration;
  int? views;
  int? videos;
  int? uploaded;
  bool? uploaderVerified;
  bool? isShort;

  RelatedStream({
    this.url,
    this.type,
    this.title,
    this.name,
    this.thumbnail,
    this.thumbnailUrl,
    this.uploaderName,
    this.uploaderUrl,
    this.uploaderAvatar,
    this.uploadedDate,
    this.shortDescription,
    this.duration,
    this.views,
    this.videos,
    this.uploaded,
    this.uploaderVerified,
    this.isShort,
  });

  factory RelatedStream.fromJson(Map<String, dynamic> json) {
    return _$RelatedStreamFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RelatedStreamToJson(this);
}
