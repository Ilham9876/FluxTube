part of 'subscribe_bloc.dart';

@freezed
class SubscribeEvent with _$SubscribeEvent {
  const factory SubscribeEvent.addSubscribe({
    required Subscribe channelInfo,
    @Default('default') String profileName,
  }) = AddSubscribe;
  const factory SubscribeEvent.deleteSubscribeInfo({
    required String id,
    @Default('default') String profileName,
  }) = DeleteSubscribeInfo;
  const factory SubscribeEvent.getAllSubscribeList({
    @Default('default') String profileName,
  }) = GetAllSubscribeList;
  const factory SubscribeEvent.checkSubscribeInfo({
    required String id,
    @Default('default') String profileName,
  }) = CheckSubscribeInfo;
  const factory SubscribeEvent.updateSubscribeOldList(
      {required List<Subscribe> subscribedChannels}) = UpdateSubscribeOldList;
}
