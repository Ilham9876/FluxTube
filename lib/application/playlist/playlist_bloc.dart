import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/playlist/models/invidious/invidious_playlist_resp.dart';
import 'package:fluxtube/domain/playlist/models/piped/playlist_resp.dart';
import 'package:fluxtube/domain/playlist/models/piped/playlist_video.dart';
import 'package:fluxtube/domain/playlist/playlist_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'playlist_event.dart';
part 'playlist_state.dart';
part 'playlist_bloc.freezed.dart';

@injectable
class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistService playlistService;

  PlaylistBloc(this.playlistService) : super(PlaylistState.initialize()) {
    on<GetPlaylistData>(_onGetPlaylistData);
    on<GetMorePlaylistVideos>(_onGetMorePlaylistVideos);
  }

  Future<void> _onGetPlaylistData(
    GetPlaylistData event,
    Emitter<PlaylistState> emit,
  ) async {
    emit(state.copyWith(
      fetchStatus: ApiStatus.loading,
      isMoreFetchCompleted: false,
    ));

    if (event.serviceType == YouTubeServices.invidious.name) {
      final result = await playlistService.getInvidiousPlaylistData(
        playlistId: event.playlistId,
      );
      result.fold(
        (failure) => emit(state.copyWith(fetchStatus: ApiStatus.error)),
        (data) => emit(state.copyWith(
          fetchStatus: ApiStatus.loaded,
          invidiousPlaylistResp: data,
        )),
      );
    } else {
      final result = await playlistService.getPlaylistData(
        playlistId: event.playlistId,
      );
      result.fold(
        (failure) => emit(state.copyWith(fetchStatus: ApiStatus.error)),
        (data) => emit(state.copyWith(
          fetchStatus: ApiStatus.loaded,
          pipedPlaylistResp: data,
        )),
      );
    }
  }

  Future<void> _onGetMorePlaylistVideos(
    GetMorePlaylistVideos event,
    Emitter<PlaylistState> emit,
  ) async {
    if (event.nextPage == null) {
      emit(state.copyWith(isMoreFetchCompleted: true));
      return;
    }

    emit(state.copyWith(moreFetchStatus: ApiStatus.loading));

    final result = await playlistService.getMorePlaylistVideos(
      playlistId: event.playlistId,
      nextPage: event.nextPage!,
    );

    result.fold(
      (failure) => emit(state.copyWith(moreFetchStatus: ApiStatus.error)),
      (data) {
        final currentResp = state.pipedPlaylistResp;
        final List<PlaylistVideo> updatedVideos = [
          ...(currentResp?.relatedStreams ?? <PlaylistVideo>[]),
          ...(data.relatedStreams ?? <PlaylistVideo>[]),
        ];
        final updatedResp = PlaylistResp(
          name: currentResp?.name,
          thumbnailUrl: currentResp?.thumbnailUrl,
          bannerUrl: currentResp?.bannerUrl,
          nextpage: data.nextpage,
          uploader: currentResp?.uploader,
          uploaderUrl: currentResp?.uploaderUrl,
          uploaderAvatar: currentResp?.uploaderAvatar,
          videos: currentResp?.videos,
          relatedStreams: updatedVideos,
        );
        emit(state.copyWith(
          moreFetchStatus: ApiStatus.loaded,
          pipedPlaylistResp: updatedResp,
          isMoreFetchCompleted: data.nextpage == null,
        ));
      },
    );
  }
}
