import 'package:json_annotation/json_annotation.dart';
import 'related_stream.dart';

part 'tab_content.g.dart';

@JsonSerializable()
class TabContent {
  String? nextpage;
  List<RelatedStream>? content;

  TabContent({this.nextpage, this.content});

  factory TabContent.fromJson(Map<String, dynamic> json) =>
      _$TabContentFromJson(json);

  Map<String, dynamic> toJson() => _$TabContentToJson(this);
}
