part of 'playlist_bloc.dart';

@freezed
class PlaylistEvent with _$PlaylistEvent {
  const factory PlaylistEvent.getPlaylistData({
    required String playlistId,
    required String serviceType,
  }) = GetPlaylistData;

  const factory PlaylistEvent.getMorePlaylistVideos({
    required String playlistId,
    String? nextPage,
  }) = GetMorePlaylistVideos;
}
