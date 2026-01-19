import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/channel/channel_services.dart';
import 'package:fluxtube/domain/channel/models/invidious/invidious_channel_resp.dart';
import 'package:fluxtube/domain/channel/models/invidious/latest_video.dart';
import 'package:fluxtube/domain/channel/models/newpipe/newpipe_channel_resp.dart';
import 'package:fluxtube/domain/channel/models/piped/channel_resp.dart';
import 'package:fluxtube/domain/channel/models/piped/tab_content.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'channel_event.dart';
part 'channel_state.dart';
part 'channel_bloc.freezed.dart';

@injectable
class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final ChannelServices channelServices;

  ChannelBloc(
    this.channelServices,
  ) : super(ChannelState.initialize()) {
    on<GetChannelData>((event, emit) async {
      // Set loading state
      emit(state.copyWith(
          channelDetailsFetchStatus: ApiStatus.loading,
          pipedChannelResp: null,
          invidiousChannelResp: null,
          newPipeChannelResp: null));

      // Call the appropriate service method based on the serviceType
      if (event.serviceType == YouTubeServices.invidious.name) {
        log("--------invidious bloc---------");
        await _fetchInvidiousChannelInfo(event, emit);
      } else if (event.serviceType == YouTubeServices.newpipe.name) {
        log("--------newpipe bloc---------");
        await _fetchNewPipeChannelInfo(event, emit);
      } else {
        log("--------piped bloc---------");
        await _fetchPipedChannelInfo(event, emit);
      }
    });

    // Fetch more videos
    on<GetMoreChannelVideos>((event, emit) async {
      emit(state.copyWith(
          moreChannelDetailsFetchStatus: ApiStatus.loading,
          isMoreFetchCompleted: false));

      if (event.serviceType == YouTubeServices.invidious.name) {
        await _fetchMoreInvidiousVideos(event, emit);
      } else {
        await _fetchMorePipedVideos(event, emit);
      }
    });

    // Fetch channel tab content
    on<GetChannelTabContent>((event, emit) async {
      emit(state.copyWith(
          tabContentFetchStatus: ApiStatus.loading,
          selectedTabContent: null));

      await _fetchChannelTabContent(event, emit);
    });

    // Select tab
    on<SelectTab>((event, emit) {
      emit(state.copyWith(
          selectedTabIndex: event.index,
          selectedTabContent: null,
          tabContentFetchStatus: ApiStatus.initial));
    });
  }

  Future<void> _fetchPipedChannelInfo(
      GetChannelData event, Emitter<ChannelState> emit) async {
    final result =
        await channelServices.getChannelData(channelId: event.channelId);
    final _state = result.fold(
      (failure) => state.copyWith(channelDetailsFetchStatus: ApiStatus.error),
      (response) => state.copyWith(
          channelDetailsFetchStatus: ApiStatus.loaded,
          pipedChannelResp: response),
    );
    emit(_state);
  }

  Future<void> _fetchInvidiousChannelInfo(
      GetChannelData event, Emitter<ChannelState> emit) async {
    final result = await channelServices.getInvidiousChannelData(
        channelId: event.channelId);
    final _state = result.fold(
      (failure) => state.copyWith(channelDetailsFetchStatus: ApiStatus.error),
      (response) => state.copyWith(
          channelDetailsFetchStatus: ApiStatus.loaded,
          invidiousChannelResp: response),
    );
    emit(_state);
  }

  Future<void> _fetchNewPipeChannelInfo(
      GetChannelData event, Emitter<ChannelState> emit) async {
    final result = await channelServices.getNewPipeChannelData(
        channelId: event.channelId);
    final _state = result.fold(
      (failure) => state.copyWith(channelDetailsFetchStatus: ApiStatus.error),
      (response) => state.copyWith(
          channelDetailsFetchStatus: ApiStatus.loaded,
          newPipeChannelResp: response),
    );
    emit(_state);
  }

  Future<void> _fetchMorePipedVideos(
      GetMoreChannelVideos event, Emitter<ChannelState> emit) async {
    final result = await channelServices.getMoreChannelVideos(
        channelId: event.channelId, nextPage: event.nextPage);

    final _state = result.fold(
      (failure) => state.copyWith(
          moreChannelDetailsFetchStatus: ApiStatus.error,
          isMoreFetchCompleted: false),
      (response) {
        if (response.nextpage == null) {
          return state.copyWith(
              moreChannelDetailsFetchStatus: ApiStatus.loaded,
              isMoreFetchCompleted: true);
        } else {
          final currentResp = state.pipedChannelResp;
          final updatedResp = ChannelResp(
            id: currentResp?.id,
            name: currentResp?.name,
            avatarUrl: currentResp?.avatarUrl,
            bannerUrl: currentResp?.bannerUrl,
            description: currentResp?.description,
            nextpage: response.nextpage,
            subscriberCount: currentResp?.subscriberCount,
            verified: currentResp?.verified,
            relatedStreams: [...(currentResp?.relatedStreams ?? []), ...(response.relatedStreams ?? [])],
            tabs: currentResp?.tabs,
          );
          return state.copyWith(
              moreChannelDetailsFetchStatus: ApiStatus.loaded,
              pipedChannelResp: updatedResp);
        }
      },
    );
    emit(_state);
  }

  Future<void> _fetchMoreInvidiousVideos(
      GetMoreChannelVideos event, Emitter<ChannelState> emit) async {
    final result = await channelServices.getMoreInvidiousChannelVideos(
        channelId: event.channelId, page: state.invidiousPage);

    final _state = result.fold(
      (failure) => state.copyWith(
          moreChannelDetailsFetchStatus: ApiStatus.error,
          isMoreFetchCompleted: false),
      (List<LatestVideo> videos) {
        if (videos.isEmpty) {
          return state.copyWith(
              moreChannelDetailsFetchStatus: ApiStatus.loaded,
              isMoreFetchCompleted: true);
        } else {
          final currentResp = state.invidiousChannelResp;
          final updatedResp = InvidiousChannelResp(
            author: currentResp?.author,
            authorId: currentResp?.authorId,
            authorUrl: currentResp?.authorUrl,
            authorBanners: currentResp?.authorBanners,
            authorThumbnails: currentResp?.authorThumbnails,
            subCount: currentResp?.subCount,
            totalViews: currentResp?.totalViews,
            joined: currentResp?.joined,
            autoGenerated: currentResp?.autoGenerated,
            isFamilyFriendly: currentResp?.isFamilyFriendly,
            description: currentResp?.description,
            descriptionHtml: currentResp?.descriptionHtml,
            allowedRegions: currentResp?.allowedRegions,
            tabs: currentResp?.tabs,
            tags: currentResp?.tags,
            authorVerified: currentResp?.authorVerified,
            latestVideos: [...(currentResp?.latestVideos ?? []), ...videos],
            relatedChannels: currentResp?.relatedChannels,
          );
          return state.copyWith(
              moreChannelDetailsFetchStatus: ApiStatus.loaded,
              invidiousChannelResp: updatedResp,
              invidiousPage: state.invidiousPage + 1);
        }
      },
    );
    emit(_state);
  }

  Future<void> _fetchChannelTabContent(
      GetChannelTabContent event, Emitter<ChannelState> emit) async {
    // Set loading state based on tab name
    if (event.tabName == 'shorts') {
      emit(state.copyWith(shortsTabFetchStatus: ApiStatus.loading));
    } else if (event.tabName == 'playlists') {
      emit(state.copyWith(playlistsTabFetchStatus: ApiStatus.loading));
    } else {
      emit(state.copyWith(tabContentFetchStatus: ApiStatus.loading));
    }

    final result = await channelServices.getChannelTabContent(data: event.tabData);

    final _state = result.fold(
      (failure) {
        if (event.tabName == 'shorts') {
          return state.copyWith(
              shortsTabFetchStatus: ApiStatus.error, shortsTabContent: null);
        } else if (event.tabName == 'playlists') {
          return state.copyWith(
              playlistsTabFetchStatus: ApiStatus.error,
              playlistsTabContent: null);
        }
        return state.copyWith(
            tabContentFetchStatus: ApiStatus.error, selectedTabContent: null);
      },
      (response) {
        if (event.tabName == 'shorts') {
          return state.copyWith(
              shortsTabFetchStatus: ApiStatus.loaded, shortsTabContent: response);
        } else if (event.tabName == 'playlists') {
          return state.copyWith(
              playlistsTabFetchStatus: ApiStatus.loaded,
              playlistsTabContent: response);
        }
        return state.copyWith(
            tabContentFetchStatus: ApiStatus.loaded, selectedTabContent: response);
      },
    );
    emit(_state);
  }
}
