import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxtube/core/animations/animations.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/core/operations/math_operations.dart';
import 'package:fluxtube/generated/l10n.dart';

/// Redesigned video info section with better typography hierarchy
class VideoInfoSection extends StatefulWidget {
  const VideoInfoSection({
    super.key,
    required this.title,
    this.viewCount,
    this.uploadDate,
    this.description,
    this.onDescriptionTap,
    this.showDescription = false,
  });

  final String title;
  final int? viewCount;
  final String? uploadDate;
  final String? description;
  final VoidCallback? onDescriptionTap;
  final bool showDescription;

  @override
  State<VideoInfoSection> createState() => _VideoInfoSectionState();
}

class _VideoInfoSectionState extends State<VideoInfoSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locals = S.of(context);

    final formattedViews = widget.viewCount != null
        ? formatCount(widget.viewCount.toString())
        : null;

    return FadeSlideIn(
      delay: const Duration(milliseconds: 100),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            ScaleTap(
              onTap: widget.description != null ? _toggleExpand : null,
              enableHaptic: false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: AppFontSize.subtitle,
                        height: 1.3,
                      ),
                      maxLines: _isExpanded ? null : 2,
                      overflow: _isExpanded ? null : TextOverflow.ellipsis,
                    ),
                  ),
                  if (widget.description != null) ...[
                    AppSpacing.width8,
                    AnimatedRotation(
                      duration: AppAnimations.fast,
                      turns: _isExpanded ? 0.5 : 0,
                      child: Icon(
                        CupertinoIcons.chevron_down,
                        size: AppIconSize.sm,
                        color: isDark
                            ? AppColors.onSurfaceVariantDark
                            : AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            AppSpacing.height8,

            // Meta info row (views + date)
            Row(
              children: [
                if (formattedViews != null) ...[
                  Text(
                    '$formattedViews ${locals.videoViews(widget.viewCount!)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.onSurfaceVariantDark
                          : AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
                if (formattedViews != null && widget.uploadDate != null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                    child: Text(
                      '•',
                      style: TextStyle(
                        color: isDark
                            ? AppColors.onSurfaceVariantDark
                            : AppColors.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
                if (widget.uploadDate != null) ...[
                  Text(
                    widget.uploadDate!,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.onSurfaceVariantDark
                          : AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),

            // Description (expandable)
            if (widget.description != null) ...[
              AnimatedSize(
                duration: AppAnimations.medium,
                curve: AppAnimations.defaultCurve,
                alignment: Alignment.topLeft,
                child: _isExpanded
                    ? Padding(
                        padding: const EdgeInsets.only(top: AppSpacing.md),
                        child: Text(
                          widget.description!,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? AppColors.onSurfaceDark
                                : AppColors.onSurface,
                            height: 1.5,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _toggleExpand() {
    setState(() => _isExpanded = !_isExpanded);
  }
}

/// Compact video info for landscape mode
class VideoInfoCompact extends StatelessWidget {
  const VideoInfoCompact({
    super.key,
    required this.title,
    this.viewCount,
  });

  final String title;
  final int? viewCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final locals = S.of(context);

    final formattedViews = viewCount != null
        ? formatCount(viewCount.toString())
        : null;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (formattedViews != null) ...[
            AppSpacing.height4,
            Text(
              '$formattedViews ${locals.videoViews(viewCount!)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: isDark
                    ? AppColors.onSurfaceVariantDark
                    : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// Loading skeleton for video info
class VideoInfoSkeleton extends StatelessWidget {
  const VideoInfoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final skeletonColor = isDark ? AppColors.surfaceVariantDark : AppColors.surfaceVariant;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title skeleton
          Container(
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: skeletonColor,
              borderRadius: AppRadius.borderXs,
            ),
          ),
          AppSpacing.height8,
          Container(
            height: 20,
            width: 200,
            decoration: BoxDecoration(
              color: skeletonColor,
              borderRadius: AppRadius.borderXs,
            ),
          ),
          AppSpacing.height12,
          // Meta skeleton
          Container(
            height: 14,
            width: 150,
            decoration: BoxDecoration(
              color: skeletonColor,
              borderRadius: AppRadius.borderXs,
            ),
          ),
        ],
      ),
    );
  }
}
