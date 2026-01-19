import 'package:dartz/dartz.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/subscribes/models/subscribe.dart';

abstract class SubscribeServices {
  Future<Either<MainFailure, List<Subscribe>>> addSubscriberInfo(
      {required Subscribe subscribeInfo, String profileName = 'default'});
  Future<Either<MainFailure, List<Subscribe>>> getSubscriberInfoList(
      {String profileName = 'default'});
  Future<Either<MainFailure, List<Subscribe>>> deleteSubscriberInfo(
      {required String id, String profileName = 'default'});
  Future<Either<MainFailure, Subscribe>> checkSubscriberInfo(
      {required String id, String profileName = 'default'});
}
