// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newpipe_stream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPipeAudioStream _$NewPipeAudioStreamFromJson(Map<String, dynamic> json) =>
    NewPipeAudioStream(
      url: json['url'] as String?,
      averageBitrate: (json['averageBitrate'] as num?)?.toInt(),
      format: json['format'] as String?,
      mimeType: json['mimeType'] as String?,
      codec: json['codec'] as String?,
      quality: json['quality'] as String?,
      id: json['id'] as String?,
      itag: (json['itag'] as num?)?.toInt(),
      initStart: (json['initStart'] as num?)?.toInt(),
      initEnd: (json['initEnd'] as num?)?.toInt(),
      indexStart: (json['indexStart'] as num?)?.toInt(),
      indexEnd: (json['indexEnd'] as num?)?.toInt(),
      contentLength: (json['contentLength'] as num?)?.toInt(),
      bitrate: (json['bitrate'] as num?)?.toInt(),
      approxDurationMs: (json['approxDurationMs'] as num?)?.toInt(),
      audioChannels: (json['audioChannels'] as num?)?.toInt(),
      sampleRate: (json['sampleRate'] as num?)?.toInt(),
      audioTrackId: json['audioTrackId'] as String?,
      audioTrackName: json['audioTrackName'] as String?,
      audioTrackType: json['audioTrackType'] as String?,
      audioLocale: json['audioLocale'] as String?,
    );

Map<String, dynamic> _$NewPipeAudioStreamToJson(NewPipeAudioStream instance) =>
    <String, dynamic>{
      'url': instance.url,
      'averageBitrate': instance.averageBitrate,
      'format': instance.format,
      'mimeType': instance.mimeType,
      'codec': instance.codec,
      'quality': instance.quality,
      'id': instance.id,
      'itag': instance.itag,
      'initStart': instance.initStart,
      'initEnd': instance.initEnd,
      'indexStart': instance.indexStart,
      'indexEnd': instance.indexEnd,
      'contentLength': instance.contentLength,
      'bitrate': instance.bitrate,
      'approxDurationMs': instance.approxDurationMs,
      'audioChannels': instance.audioChannels,
      'sampleRate': instance.sampleRate,
      'audioTrackId': instance.audioTrackId,
      'audioTrackName': instance.audioTrackName,
      'audioTrackType': instance.audioTrackType,
      'audioLocale': instance.audioLocale,
    };

NewPipeVideoStream _$NewPipeVideoStreamFromJson(Map<String, dynamic> json) =>
    NewPipeVideoStream(
      url: json['url'] as String?,
      resolution: json['resolution'] as String?,
      format: json['format'] as String?,
      mimeType: json['mimeType'] as String?,
      codec: json['codec'] as String?,
      quality: json['quality'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      fps: (json['fps'] as num?)?.toInt(),
      isVideoOnly: json['isVideoOnly'] as bool?,
      id: json['id'] as String?,
      itag: (json['itag'] as num?)?.toInt(),
      initStart: (json['initStart'] as num?)?.toInt(),
      initEnd: (json['initEnd'] as num?)?.toInt(),
      indexStart: (json['indexStart'] as num?)?.toInt(),
      indexEnd: (json['indexEnd'] as num?)?.toInt(),
      contentLength: (json['contentLength'] as num?)?.toInt(),
      bitrate: (json['bitrate'] as num?)?.toInt(),
      approxDurationMs: (json['approxDurationMs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NewPipeVideoStreamToJson(NewPipeVideoStream instance) =>
    <String, dynamic>{
      'url': instance.url,
      'resolution': instance.resolution,
      'format': instance.format,
      'mimeType': instance.mimeType,
      'codec': instance.codec,
      'quality': instance.quality,
      'width': instance.width,
      'height': instance.height,
      'fps': instance.fps,
      'isVideoOnly': instance.isVideoOnly,
      'id': instance.id,
      'itag': instance.itag,
      'initStart': instance.initStart,
      'initEnd': instance.initEnd,
      'indexStart': instance.indexStart,
      'indexEnd': instance.indexEnd,
      'contentLength': instance.contentLength,
      'bitrate': instance.bitrate,
      'approxDurationMs': instance.approxDurationMs,
    };
