// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invidious_playlist_resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvidiousPlaylistResp _$InvidiousPlaylistRespFromJson(
        Map<String, dynamic> json) =>
    InvidiousPlaylistResp(
      type: json['type'] as String?,
      title: json['title'] as String?,
      playlistId: json['playlistId'] as String?,
      playlistThumbnail: json['playlistThumbnail'] as String?,
      author: json['author'] as String?,
      authorId: json['authorId'] as String?,
      authorUrl: json['authorUrl'] as String?,
      authorThumbnails: (json['authorThumbnails'] as List<dynamic>?)
          ?.map((e) => AuthorThumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      descriptionHtml: json['descriptionHtml'] as String?,
      videoCount: (json['videoCount'] as num?)?.toInt(),
      viewCount: (json['viewCount'] as num?)?.toInt(),
      updated: (json['updated'] as num?)?.toInt(),
      isListed: json['isListed'] as bool?,
      videos: (json['videos'] as List<dynamic>?)
          ?.map(
              (e) => InvidiousPlaylistVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InvidiousPlaylistRespToJson(
        InvidiousPlaylistResp instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'playlistId': instance.playlistId,
      'playlistThumbnail': instance.playlistThumbnail,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'authorThumbnails': instance.authorThumbnails,
      'description': instance.description,
      'descriptionHtml': instance.descriptionHtml,
      'videoCount': instance.videoCount,
      'viewCount': instance.viewCount,
      'updated': instance.updated,
      'isListed': instance.isListed,
      'videos': instance.videos,
    };

InvidiousPlaylistVideo _$InvidiousPlaylistVideoFromJson(
        Map<String, dynamic> json) =>
    InvidiousPlaylistVideo(
      title: json['title'] as String?,
      videoId: json['videoId'] as String?,
      author: json['author'] as String?,
      authorId: json['authorId'] as String?,
      authorUrl: json['authorUrl'] as String?,
      videoThumbnails: (json['videoThumbnails'] as List<dynamic>?)
          ?.map((e) => VideoThumbnail.fromJson(e as Map<String, dynamic>))
          .toList(),
      index: (json['index'] as num?)?.toInt(),
      lengthSeconds: (json['lengthSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InvidiousPlaylistVideoToJson(
        InvidiousPlaylistVideo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'videoId': instance.videoId,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'videoThumbnails': instance.videoThumbnails,
      'index': instance.index,
      'lengthSeconds': instance.lengthSeconds,
    };

AuthorThumbnail _$AuthorThumbnailFromJson(Map<String, dynamic> json) =>
    AuthorThumbnail(
      url: json['url'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AuthorThumbnailToJson(AuthorThumbnail instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
