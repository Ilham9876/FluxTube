import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluxtube/core/colors.dart';
import 'package:fluxtube/core/constants.dart';
import 'package:fluxtube/generated/l10n.dart';
import 'package:lottie/lottie.dart';

/// Modern error widget with user-friendly error messages
/// Does not show stack traces or internal error details
class ErrorRetryWidget extends StatelessWidget {
  const ErrorRetryWidget({
    super.key,
    required this.lottie,
    this.onTap,
    this.errorType = ErrorType.generic,
    this.customMessage,
  });

  final String lottie;
  final VoidCallback? onTap;
  final ErrorType errorType;
  final String? customMessage;

  @override
  Widget build(BuildContext context) {
    final S locals = S.of(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lottie animation
            LottieBuilder.asset(
              lottie,
              width: 180,
              height: 180,
            ),
            AppSpacing.height24,

            // Error title
            Text(
              _getErrorTitle(locals),
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.onSurfaceDark : AppColors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.height12,

            // Error description
            Text(
              customMessage ?? _getErrorDescription(locals),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.onSurfaceVariantDark
                    : AppColors.onSurfaceVariant,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            AppSpacing.height32,

            // Retry button
            if (onTap != null)
              _RetryButton(
                onTap: onTap!,
                label: locals.retry,
              ),
          ],
        ),
      ),
    );
  }

  String _getErrorTitle(S locals) {
    switch (errorType) {
      case ErrorType.network:
        return 'Connection Error';
      case ErrorType.server:
        return 'Service Unavailable';
      case ErrorType.notFound:
        return 'Content Not Found';
      case ErrorType.empty:
        return 'No Results';
      case ErrorType.generic:
        return 'Something went wrong';
    }
  }

  String _getErrorDescription(S locals) {
    switch (errorType) {
      case ErrorType.network:
        return 'Please check your internet connection and try again.';
      case ErrorType.server:
        return 'The service is temporarily unavailable. Please try again later or switch to a different instance.';
      case ErrorType.notFound:
        return 'The content you\'re looking for doesn\'t exist or has been removed.';
      case ErrorType.empty:
        return 'No content available at the moment. Try refreshing or check back later.';
      case ErrorType.generic:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}

/// Error types for different scenarios
enum ErrorType {
  generic,
  network,
  server,
  notFound,
  empty,
}

/// Modern retry button with animation
class _RetryButton extends StatelessWidget {
  const _RetryButton({
    required this.onTap,
    required this.label,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.xl,
            vertical: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                CupertinoIcons.refresh,
                color: kWhiteColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Compact error widget for inline error states
class CompactErrorWidget extends StatelessWidget {
  const CompactErrorWidget({
    super.key,
    this.message,
    this.onRetry,
    this.icon,
  });

  final String? message;
  final VoidCallback? onRetry;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      margin: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: isDark
            ? AppColors.errorDark.withValues(alpha: 0.1)
            : AppColors.error.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? AppColors.errorDark.withValues(alpha: 0.3)
              : AppColors.error.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon ?? CupertinoIcons.exclamationmark_circle,
            color: isDark ? AppColors.errorDark : AppColors.error,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message ?? 'An error occurred',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: isDark ? AppColors.onSurfaceDark : AppColors.onSurface,
              ),
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(width: 8),
            IconButton(
              onPressed: onRetry,
              icon: Icon(
                CupertinoIcons.refresh,
                color: AppColors.primary,
                size: 20,
              ),
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ],
      ),
    );
  }
}

/// Empty state widget with modern design
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.action,
    this.actionLabel,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? action;
  final String? actionLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.surfaceVariantDark
                    : AppColors.surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 48,
                color: isDark
                    ? AppColors.onSurfaceVariantDark
                    : AppColors.onSurfaceVariant,
              ),
            ),
            AppSpacing.height24,
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.onSurfaceDark : AppColors.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              AppSpacing.height8,
              Text(
                subtitle!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: isDark
                      ? AppColors.onSurfaceVariantDark
                      : AppColors.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (action != null && actionLabel != null) ...[
              AppSpacing.height24,
              TextButton(
                onPressed: action,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                ),
                child: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Video load error widget - specific for video playback errors
class VideoErrorWidget extends StatelessWidget {
  const VideoErrorWidget({
    super.key,
    required this.onRetry,
    this.errorMessage,
  });

  final VoidCallback onRetry;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: kBlackColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kWhiteColor.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                CupertinoIcons.play_circle,
                color: kWhiteColor,
                size: 48,
              ),
            ),
            AppSpacing.height16,
            Text(
              'Unable to play video',
              style: theme.textTheme.titleMedium?.copyWith(
                color: kWhiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppSpacing.height8,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                errorMessage ?? 'There was a problem loading this video. Please try again.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: kWhiteColor.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            AppSpacing.height24,
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(
                CupertinoIcons.refresh,
                color: kWhiteColor,
                size: 18,
              ),
              label: const Text(
                'Try Again',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
