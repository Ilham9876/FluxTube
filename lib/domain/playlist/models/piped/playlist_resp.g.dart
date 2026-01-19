// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaylistResp _$PlaylistRespFromJson(Map<String, dynamic> json) => PlaylistResp(
      name: json['name'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      nextpage: json['nextpage'] as String?,
      uploader: json['uploader'] as String?,
      uploaderUrl: json['uploaderUrl'] as String?,
      uploaderAvatar: json['uploaderAvatar'] as String?,
      videos: (json['videos'] as num?)?.toInt(),
      relatedStreams: (json['relatedStreams'] as List<dynamic>?)
          ?.map((e) => PlaylistVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlaylistRespToJson(PlaylistResp instance) =>
    <String, dynamic>{
      'name': instance.name,
      'thumbnailUrl': instance.thumbnailUrl,
      'bannerUrl': instance.bannerUrl,
      'nextpage': instance.nextpage,
      'uploader': instance.uploader,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderAvatar': instance.uploaderAvatar,
      'videos': instance.videos,
      'relatedStreams': instance.relatedStreams,
    };
