import 'package:json_annotation/json_annotation.dart';
import 'package:fluxtube/domain/watch/models/newpipe/newpipe_related.dart';

part 'newpipe_channel_resp.g.dart';

@JsonSerializable()
class NewPipeChannelResp {
  final String? id;
  final String? name;
  final String? description;
  final String? avatarUrl;
  final String? bannerUrl;
  final int? subscriberCount;
  final bool? isVerified;
  final List<NewPipeRelatedStream>? videos;
  final String? nextPage;
  final List<NewPipeChannelTab>? tabs;

  NewPipeChannelResp({
    this.id,
    this.name,
    this.description,
    this.avatarUrl,
    this.bannerUrl,
    this.subscriberCount,
    this.isVerified,
    this.videos,
    this.nextPage,
    this.tabs,
  });

  factory NewPipeChannelResp.fromJson(Map<String, dynamic> json) =>
      _$NewPipeChannelRespFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeChannelRespToJson(this);
}

@JsonSerializable()
class NewPipeChannelTab {
  final String? name;
  final String? url;
  final String? id;
  final List<String>? contentFilters;

  NewPipeChannelTab({
    this.name,
    this.url,
    this.id,
    this.contentFilters,
  });

  factory NewPipeChannelTab.fromJson(Map<String, dynamic> json) =>
      _$NewPipeChannelTabFromJson(json);

  Map<String, dynamic> toJson() => _$NewPipeChannelTabToJson(this);
}
