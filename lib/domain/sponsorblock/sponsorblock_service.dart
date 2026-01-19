import 'package:dartz/dartz.dart';
import 'package:fluxtube/domain/core/failure/main_failure.dart';
import 'package:fluxtube/domain/sponsorblock/models/sponsor_segment.dart';

abstract class SponsorBlockService {
  /// Fetch sponsor segments for a video
  /// [videoId] - YouTube video ID
  /// [categories] - List of categories to fetch (sponsor, intro, outro, selfpromo, interaction, music_offtopic)
  Future<Either<MainFailure, List<SponsorSegment>>> getSegments({
    required String videoId,
    required List<String> categories,
  });
}
