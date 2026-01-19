part of 'saved_bloc.dart';

@freezed
class SavedEvent with _$SavedEvent {
  const factory SavedEvent.addVideoInfo({
    required LocalStoreVideoInfo videoInfo,
    @Default('default') String profileName,
  }) = AddVideoInfo;
  const factory SavedEvent.deleteVideoInfo({
    required String id,
    @Default('default') String profileName,
  }) = DeleteVideoInfo;
  const factory SavedEvent.getAllVideoInfoList({
    @Default('default') String profileName,
  }) = GetAllVideoInfoList;
  const factory SavedEvent.checkVideoInfo({
    required String id,
    @Default('default') String profileName,
  }) = CheckVideoInfo;
  const factory SavedEvent.trackVideoWatch({
    required String videoId,
  }) = TrackVideoWatch;
  const factory SavedEvent.trackSearch({
    required String query,
  }) = TrackSearch;
  /// Update only playback position and history status without affecting isSaved state
  /// This prevents race condition where history updates overwrite manual save state
  const factory SavedEvent.updatePlaybackPosition({
    required LocalStoreVideoInfo videoInfo,
    @Default('default') String profileName,
  }) = UpdatePlaybackPosition;
}
