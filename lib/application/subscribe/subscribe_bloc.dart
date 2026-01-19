import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/core/enums.dart';
import 'package:fluxtube/domain/subscribes/subscribe_services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/failure/main_failure.dart';
import '../../domain/subscribes/models/subscribe.dart';

part 'subscribe_event.dart';
part 'subscribe_state.dart';
part 'subscribe_bloc.freezed.dart';

@injectable
class SubscribeBloc extends Bloc<SubscribeEvent, SubscribeState> {
  final SubscribeServices _subscribeServices;

  SubscribeBloc(this._subscribeServices,)
      : super(SubscribeState.initialize()) {
    // get all subscribed channel list from local storage
    on<GetAllSubscribeList>((event, emit) async {
      emit(state.copyWith(
          subscribeStatus: ApiStatus.loading, subscribedChannels: []));

      final _result = await _subscribeServices.getSubscriberInfoList(
          profileName: event.profileName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(subscribeStatus: ApiStatus.error),
          (List<Subscribe> resp) {
        if (state.subscribedChannels != resp) {
          // When loading subscriptions for a profile, also update oldList
          // to prevent auto-refresh in home screen when switching profiles.
          // The home screen's auto-refresh logic compares oldList.length with
          // subscribedChannels.length. By keeping them in sync during profile
          // switch, we prevent unnecessary feed refreshes.
          return state.copyWith(
              subscribeStatus: ApiStatus.loaded,
              subscribedChannels: resp,
              oldList: resp,);
        } else {
          return state;
        }
      });

      emit(_state);
    });

    // update old subscribed channels list
    on<UpdateSubscribeOldList>((event, emit) async {
      emit(state.copyWith(oldList: event.subscribedChannels));
    });

    // add subscribed channel data to local storage
    on<AddSubscribe>((event, emit) async {
      emit(state.copyWith(subscribeStatus: ApiStatus.loading));

      final _result = await _subscribeServices.addSubscriberInfo(
          subscribeInfo: event.channelInfo, profileName: event.profileName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(subscribeStatus: ApiStatus.error),
          (List<Subscribe> resp) => state.copyWith(
              subscribeStatus: ApiStatus.loaded, subscribedChannels: resp));

      emit(_state);
      add(CheckSubscribeInfo(id: event.channelInfo.id, profileName: event.profileName));
      // Note: Don't call GetAllSubscribeList here - it's already updated by addSubscriberInfo
      // and calling it would sync oldList, preventing the home screen from detecting the change
    });

    // delete channel data from local storage
    on<DeleteSubscribeInfo>((event, emit) async {
      emit(state.copyWith(subscribeStatus: ApiStatus.loading));

      final _result = await _subscribeServices.deleteSubscriberInfo(
          id: event.id, profileName: event.profileName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(subscribeStatus: ApiStatus.error),
          (List<Subscribe> resp) => state.copyWith(
              subscribeStatus: ApiStatus.loaded, subscribedChannels: resp));

      emit(_state);
      add(CheckSubscribeInfo(id: event.id, profileName: event.profileName));
      // Note: Don't call GetAllSubscribeList here - it's already updated by deleteSubscriberInfo
      // and calling it would sync oldList, preventing the home screen from detecting the change
    });

    // check the playing video's channel present in the subscribed list
    on<CheckSubscribeInfo>((event, emit) async {
      emit(state.copyWith(channelInfo: null));

      final _result = await _subscribeServices.checkSubscriberInfo(
          id: event.id, profileName: event.profileName);
      final _state = _result.fold(
          (MainFailure f) => state.copyWith(channelInfo: null),
          (Subscribe resp) => state.copyWith(channelInfo: resp));

      emit(_state);
    });
  }
}
