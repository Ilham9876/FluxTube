import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluxtube/application/application.dart';
import 'package:fluxtube/core/strings.dart';
import 'package:fluxtube/domain/saved/models/local_store.dart';
import 'package:fluxtube/domain/watch/models/explode/explode_watch.dart';
import 'package:fluxtube/presentation/settings/utils/launch_url.dart';
import 'package:fluxtube/presentation/watch/widgets/redesigned/action_buttons_row.dart';
import 'package:fluxtube/presentation/watch/widgets/redesigned/share_bottom_sheet.dart';

class ExplodeLikeSection extends StatelessWidget {
  const ExplodeLikeSection({
    super.key,
    required this.id,
    required this.watchInfo,
    required this.state,
    required this.pipClicked,
  });

  final String id;
  final ExplodeWatchResp watchInfo;
  final WatchState state;
  final VoidCallback pipClicked;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedBloc, SavedState>(
      buildWhen: (previous, current) {
        // Only rebuild if the isSaved state for THIS video actually changed
        final prevIsSaved = previous.videoInfo?.id == id &&
            (previous.videoInfo?.isSaved ?? false);
        final currIsSaved = current.videoInfo?.id == id &&
            (current.videoInfo?.isSaved ?? false);
        return prevIsSaved != currIsSaved;
      },
      builder: (context, savedState) {
        bool isSaved = (savedState.videoInfo?.id == id &&
                savedState.videoInfo?.isSaved == true)
            ? true
            : false;
        return BlocBuilder<SettingsBloc, SettingsState>(
          buildWhen: (previous, current) =>
              previous.isDislikeVisible != current.isDislikeVisible ||
              previous.isPipDisabled != current.isPipDisabled,
          builder: (context, settingsState) {
            return ActionButtonsRow(
              likes: watchInfo.likeCount,
              dislikes: watchInfo.dislikeCount,
              showDislike: settingsState.isDislikeVisible,
              isCommentActive: state.isTapComments,
              showPip: !settingsState.isPipDisabled,
              isSaved: isSaved,
              onTapComment: () {
                if (state.isDescriptionTapped) {
                  BlocProvider.of<WatchBloc>(context)
                      .add(WatchEvent.tapDescription());
                }
                BlocProvider.of<WatchBloc>(context)
                    .add(WatchEvent.getCommentData(id: id));
              },
              onTapShare: () {
                ShareBottomSheet.show(
                  context,
                  videoId: id,
                  videoTitle: watchInfo.title,
                  thumbnailUrl: watchInfo.thumbnailUrl,
                );
              },
              onTapSave: () {
                BlocProvider.of<SavedBloc>(context).add(
                  SavedEvent.addVideoInfo(
                    videoInfo: LocalStoreVideoInfo(
                        id: id,
                        title: watchInfo.title,
                        views: watchInfo.viewCount,
                        thumbnail: watchInfo.thumbnailUrl,
                        uploadedDate: watchInfo.uploadDate.toString(),
                        uploaderAvatar: null,
                        uploaderName: watchInfo.author,
                        uploaderId: watchInfo.channelId,
                        uploaderSubscriberCount: null,
                        duration: watchInfo.duration.inSeconds,
                        playbackPosition:
                            savedState.videoInfo?.playbackPosition,
                        uploaderVerified: false,
                        isSaved: !isSaved,
                        isLive: watchInfo.isLive,
                        isHistory: savedState.videoInfo?.isHistory),
                  ),
                );
              },
              onTapYoutube: () async => await urlLaunchWithSettings(context, '$kYTBaseUrl$id'),
              onTapPip: pipClicked,
            );
          },
        );
      },
    );
  }
}
