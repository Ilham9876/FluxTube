// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newpipe_trending_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPipeTrendingResp _$NewPipeTrendingRespFromJson(Map<String, dynamic> json) =>
    NewPipeTrendingResp(
      url: json['url'] as String?,
      name: json['name'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      type: json['type'] as String?,
      uploaderName: json['uploaderName'] as String?,
      uploaderUrl: json['uploaderUrl'] as String?,
      uploaderAvatarUrl: json['uploaderAvatarUrl'] as String?,
      uploaderVerified: json['uploaderVerified'] as bool?,
      duration: (json['duration'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      uploadDate: json['uploadDate'] as String?,
      isLive: json['isLive'] as bool?,
      isShort: json['isShort'] as bool?,
      contentAvailability: json['contentAvailability'] as String?,
    );

Map<String, dynamic> _$NewPipeTrendingRespToJson(
        NewPipeTrendingResp instance) =>
    <String, dynamic>{
      'url': instance.url,
      'name': instance.name,
      'thumbnailUrl': instance.thumbnailUrl,
      'type': instance.type,
      'uploaderName': instance.uploaderName,
      'uploaderUrl': instance.uploaderUrl,
      'uploaderAvatarUrl': instance.uploaderAvatarUrl,
      'uploaderVerified': instance.uploaderVerified,
      'duration': instance.duration,
      'viewCount': instance.viewCount,
      'uploadDate': instance.uploadDate,
      'isLive': instance.isLive,
      'isShort': instance.isShort,
      'contentAvailability': instance.contentAvailability,
    };

NewPipeTrendingListResp _$NewPipeTrendingListRespFromJson(
        Map<String, dynamic> json) =>
    NewPipeTrendingListResp(
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => NewPipeTrendingResp.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String?,
    );

Map<String, dynamic> _$NewPipeTrendingListRespToJson(
        NewPipeTrendingListResp instance) =>
    <String, dynamic>{
      'videos': instance.videos,
      'nextPage': instance.nextPage,
    };
