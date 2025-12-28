import 'package:fluxtube/core/strings.dart';

class ApiEndPoints {
  static String get feed => "${BaseUrl.kBaseUrl}feed/unauthenticated?channels=";
  static String get trending => "${BaseUrl.kBaseUrl}trending?region=";
  static String get watch => "${BaseUrl.kBaseUrl}streams/";
  static String get comments => "${BaseUrl.kBaseUrl}comments/";
  static String get search => "${BaseUrl.kBaseUrl}search?q=";
  static String get moreSearch => "${BaseUrl.kBaseUrl}nextpage/search?q=";
  static String get suggestions => "${BaseUrl.kBaseUrl}suggestions?query=";
  static String get commentReplies => "${BaseUrl.kBaseUrl}nextpage/comments/";
  static String get channel => "${BaseUrl.kBaseUrl}channel/";
  static String get moreChannelVideos => "${BaseUrl.kBaseUrl}nextpage/channel/";
}

class InvidiousApiEndpoints {
  static String get trending =>
      "${BaseUrl.kInvidiousBaseUrl}/api/v1/trending?region=";
  static String get search => "${BaseUrl.kInvidiousBaseUrl}/api/v1/search?q=";
  static String get suggestions =>
      "${BaseUrl.kInvidiousBaseUrl}/api/v1/search/suggestions?q=";
  static String get watch => "${BaseUrl.kInvidiousBaseUrl}/api/v1/videos/";
  static String get comments => "${BaseUrl.kInvidiousBaseUrl}/api/v1/comments/";
  static String get channel => "${BaseUrl.kInvidiousBaseUrl}/api/v1/channels/";
}
