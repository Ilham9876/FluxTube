// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tab_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TabContent _$TabContentFromJson(Map<String, dynamic> json) => TabContent(
      nextpage: json['nextpage'] as String?,
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => RelatedStream.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TabContentToJson(TabContent instance) =>
    <String, dynamic>{
      'nextpage': instance.nextpage,
      'content': instance.content,
    };
