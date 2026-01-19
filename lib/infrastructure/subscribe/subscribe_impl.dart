import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/subscribes/models/subscribe.dart';
import 'package:fluxtube/domain/subscribes/subscribe_services.dart';
import 'package:fluxtube/infrastructure/database/database.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SubscribeServices)
class SubscribeImpl extends SubscribeServices {
  AppDatabase get db => AppDatabase.instance;

  // Convert Drift Subscription to domain Subscribe
  Subscribe _toDomain(Subscription sub) {
    return Subscribe(
      id: sub.channelId,
      channelName: sub.channelName,
      isVerified: sub.isVerified,
      avatarUrl: sub.avatarUrl,
      profileName: sub.profileName,
    );
  }

  // Convert domain Subscribe to Drift companion
  SubscriptionsCompanion _toCompanion(Subscribe subscribeInfo) {
    return SubscriptionsCompanion.insert(
      channelId: subscribeInfo.id,
      profileName: subscribeInfo.profileName,
      channelName: subscribeInfo.channelName,
      isVerified: Value(subscribeInfo.isVerified ?? false),
      avatarUrl: Value(subscribeInfo.avatarUrl),
    );
  }

  // get all stored subscriptions for a specific profile
  Future<List<Subscribe>> _getSubscribeInformations(String profileName) async {
    final subscriptions = await db.getAllSubscriptions(profileName);
    return subscriptions.map(_toDomain).toList();
  }

  // add subscribe implement
  @override
  Future<Either<MainFailure, List<Subscribe>>> addSubscriberInfo(
      {required Subscribe subscribeInfo, String profileName = 'default'}) async {
    try {
      // Ensure profileName is set
      subscribeInfo.profileName = profileName;
      await db.upsertSubscription(_toCompanion(subscribeInfo));
      List<Subscribe> subscribeListAfter = await _getSubscribeInformations(profileName);
      return Right(subscribeListAfter);
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  // delete subscriber info
  @override
  Future<Either<MainFailure, List<Subscribe>>> deleteSubscriberInfo(
      {required String id, String profileName = 'default'}) async {
    try {
      await db.deleteSubscription(id, profileName);
      List<Subscribe> subscribeListAfter = await _getSubscribeInformations(profileName);
      return Right(subscribeListAfter);
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  // get all subscribed channel list for a profile
  @override
  Future<Either<MainFailure, List<Subscribe>>> getSubscriberInfoList(
      {String profileName = 'default'}) async {
    try {
      List<Subscribe> subscribesList = await _getSubscribeInformations(profileName);
      return Right(subscribesList);
    } catch (e) {
      return const Left(MainFailure.clientFailure());
    }
  }

  // check the channel is present in the local storage for a profile
  @override
  Future<Either<MainFailure, Subscribe>> checkSubscriberInfo(
      {required String id, String profileName = 'default'}) async {
    try {
      final subscription = await db.getSubscription(id, profileName);
      if (subscription == null) {
        return const Left(MainFailure.clientFailure());
      }
      return Right(_toDomain(subscription));
    } catch (e) {
      // Handle the case where the channel is not found
      return const Left(MainFailure.clientFailure());
    }
  }
}
