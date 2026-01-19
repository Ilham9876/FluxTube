// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newpipe_channel_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPipeChannelResp _$NewPipeChannelRespFromJson(Map<String, dynamic> json) =>
    NewPipeChannelResp(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      bannerUrl: json['bannerUrl'] as String?,
      subscriberCount: (json['subscriberCount'] as num?)?.toInt(),
      isVerified: json['isVerified'] as bool?,
      videos: (json['videos'] as List<dynamic>?)
          ?.map((e) => NewPipeRelatedStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPage: json['nextPage'] as String?,
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => NewPipeChannelTab.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewPipeChannelRespToJson(NewPipeChannelResp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'avatarUrl': instance.avatarUrl,
      'bannerUrl': instance.bannerUrl,
      'subscriberCount': instance.subscriberCount,
      'isVerified': instance.isVerified,
      'videos': instance.videos,
      'nextPage': instance.nextPage,
      'tabs': instance.tabs,
    };

NewPipeChannelTab _$NewPipeChannelTabFromJson(Map<String, dynamic> json) =>
    NewPipeChannelTab(
      name: json['name'] as String?,
      url: json['url'] as String?,
      id: json['id'] as String?,
      contentFilters: (json['contentFilters'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NewPipeChannelTabToJson(NewPipeChannelTab instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'id': instance.id,
      'contentFilters': instance.contentFilters,
    };
