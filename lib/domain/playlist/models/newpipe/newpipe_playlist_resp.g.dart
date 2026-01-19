// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newpipe_playlist_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPipePlaylistResp _$NewPipePlaylistRespFromJson(Map<String, dynamic> json) =>
    NewPipePlaylistResp(
      id: json['id'] as String?,
      name: json['name'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      uploaderName: json['uploaderName'] as String?,
      uploaderUrl: json['uploaderUrl'] as String?,
      uploaderAvatarUrl: json['uploaderAvatarUrl'] as String?,
      streamCount: (json['streamCount'] as num?)?.toInt(),
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => NewPipeRelatedStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String?,
    );

Map<String, dynamic> _$NewPipePlaylistRespToJson(
        NewPipePlaylistResp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnailUrl': instance.thumbnailUrl,
      'uploaderName': instance.uploaderName,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderAvatarUrl': instance.uploaderAvatarUrl,
      'streamCount': instance.streamCount,
      'videos': instance.videos,
      'nextPage': instance.nextPage,
    };
