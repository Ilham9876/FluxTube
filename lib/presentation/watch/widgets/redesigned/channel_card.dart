import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxtube/core/animations/animations.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/core/operations/math_operations.dart';
import 'package:fluxtube/generated/l10n.dart';

/// Modern channel card widget for watch screen
class ChannelCard extends StatelessWidget {
  const ChannelCard({
    super.key,
    required this.channelName,
    this.channelAvatarUrl,
    this.subscriberCount,
    this.isVerified = false,
    this.isSubscribed = false,
    this.onChannelTap,
    this.onSubscribeTap,
  });

  final String channelName;
  final String? channelAvatarUrl;
  final int? subscriberCount;
  final bool isVerified;
  final bool isSubscribed;
  final VoidCallback? onChannelTap;
  final VoidCallback? onSubscribeTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locals = S.of(context);

    final formattedSubs = subscriberCount != null
        ? formatCount(subscriberCount.toString())
        : null;

    return FadeSlideIn(
      delay: const Duration(milliseconds: 200),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isDark ? AppColors.cardDark : AppColors.cardLight,
          borderRadius: AppRadius.borderMd,
          border: Border.all(
            color: isDark ? AppColors.dividerDark : AppColors.divider,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            // Channel avatar
            ScaleTap(
              onTap: onChannelTap,
              child: CircleAvatar(
                radius: 24,
                backgroundImage: (channelAvatarUrl?.isNotEmpty ?? false)
                    ? NetworkImage(channelAvatarUrl!)
                    : null,
                backgroundColor:
                    isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
                child: (channelAvatarUrl?.isEmpty ?? true)
                    ? Icon(
                        CupertinoIcons.person_fill,
                        size: AppIconSize.lg,
                        color: AppColors.disabled,
                      )
                    : null,
              ),
            ),

            AppSpacing.width12,

            // Channel info
            Expanded(
              child: ScaleTap(
                onTap: onChannelTap,
                enableHaptic: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Channel name with verified badge
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            channelName,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (isVerified) ...[
                          AppSpacing.width4,
                          Icon(
                            CupertinoIcons.checkmark_seal_fill,
                            size: AppIconSize.xs,
                            color: isDark
                                ? AppColors.onSurfaceVariantDark
                                : AppColors.onSurfaceVariant,
                          ),
                        ],
                      ],
                    ),

                    // Subscriber count
                    if (formattedSubs != null) ...[
                      AppSpacing.height2,
                      Text(
                        '$formattedSubs ${locals.channelSubscribers(subscriberCount ?? 0)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDark
                              ? AppColors.onSurfaceVariantDark
                              : AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            AppSpacing.width12,

            // Subscribe button
            _SubscribeButton(
              isSubscribed: isSubscribed,
              onTap: onSubscribeTap,
              locals: locals,
            ),
          ],
        ),
      ),
    );
  }
}

/// Animated subscribe button
class _SubscribeButton extends StatelessWidget {
  const _SubscribeButton({
    required this.isSubscribed,
    required this.locals,
    this.onTap,
  });

  final bool isSubscribed;
  final S locals;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ScaleTap(
      onTap: onTap,
      scaleDown: 0.95,
      child: AnimatedContainer(
        duration: AppAnimations.fast,
        curve: AppAnimations.defaultCurve,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSubscribed
              ? (isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant)
              : AppColors.subscribedRed,
          borderRadius: AppRadius.borderFull,
        ),
        child: AnimatedSwitcher(
          duration: AppAnimations.fast,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
          child: Row(
            key: ValueKey(isSubscribed),
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSubscribed) ...[
                Icon(
                  CupertinoIcons.checkmark,
                  size: AppIconSize.xs,
                  color: isDark ? AppColors.onSurfaceDark : AppColors.onSurface,
                ),
                AppSpacing.width4,
              ],
              Text(
                isSubscribed ? 'Subscribed' : locals.subscribe,
                style: TextStyle(
                  fontSize: AppFontSize.body2,
                  fontWeight: FontWeight.w600,
                  color: isSubscribed
                      ? (isDark ? AppColors.onSurfaceDark : AppColors.onSurface)
                      : AppColors.onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Compact channel row for lists
class ChannelRowCompact extends StatelessWidget {
  const ChannelRowCompact({
    super.key,
    required this.channelName,
    this.channelAvatarUrl,
    this.isVerified = false,
    this.onTap,
  });

  final String channelName;
  final String? channelAvatarUrl;
  final bool isVerified;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ScaleTap(
      onTap: onTap,
      enableHaptic: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: (channelAvatarUrl?.isNotEmpty ?? false)
                  ? NetworkImage(channelAvatarUrl!)
                  : null,
              backgroundColor:
                  isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant,
            ),
            AppSpacing.width8,
            Expanded(
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      channelName,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (isVerified) ...[
                    AppSpacing.width4,
                    Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      size: AppIconSize.xs,
                      color: isDark
                          ? AppColors.onSurfaceVariantDark
                          : AppColors.onSurfaceVariant,
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              CupertinoIcons.chevron_right,
              size: AppIconSize.sm,
              color: isDark
                  ? AppColors.onSurfaceVariantDark
                  : AppColors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

/// Loading skeleton for channel card
class ChannelCardSkeleton extends StatelessWidget {
  const ChannelCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final skeletonColor = isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark ? AppColors.cardDark : AppColors.cardLight,
        borderRadius: AppRadius.borderMd,
        border: Border.all(
          color: isDark ? AppColors.dividerDark : AppColors.divider,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: skeletonColor,
          ),
          AppSpacing.width12,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 16,
                  width: 120,
                  decoration: BoxDecoration(
                    color: skeletonColor,
                    borderRadius: AppRadius.borderXs,
                  ),
                ),
                AppSpacing.height8,
                Container(
                  height: 12,
                  width: 80,
                  decoration: BoxDecoration(
                    color: skeletonColor,
                    borderRadius: AppRadius.borderXs,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 36,
            width: 100,
            decoration: BoxDecoration(
              color: skeletonColor,
              borderRadius: AppRadius.borderFull,
            ),
          ),
        ],
      ),
    );
  }
}
