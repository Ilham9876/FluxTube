import 'package:flutter/material.dart';

// Legacy colors (kept for compatibility)
const Color kWhiteColor = Colors.white;
const Color kRedColor = Colors.red;
const kBlackColor = Colors.black;
const kBlueColor = Colors.lightBlue;
const Color kTransparentColor = Colors.transparent;
Color kDarkColor = Colors.black.withValues(alpha: 0.5);
Color? kGreyColor = Colors.grey[700];
Color? kGreyOpacityColor = Colors.grey.withValues(alpha: 0.2);
Color? kBlueOpacityColor = Colors.lightBlue.withValues(alpha: 0.2);

final LinearGradient shimmerGradient = LinearGradient(colors: [
  Colors.grey.shade500,
  Colors.grey.shade600,
  Colors.grey,
  Colors.grey.shade700,
]);

/// Semantic color system for consistent theming
class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFF1976D2);
  static const Color primaryLight = Color(0xFF42A5F5);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryContainer = Color(0xFFBBDEFB);

  // Surface colors
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFF121212);
  static const Color surfaceVariant = Color(0xFFF5F5F5);
  static const Color surfaceVariantDark = Color(0xFF1E1E1E);

  // Background colors
  static const Color background = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF0A0A0A);

  // On colors (text/icons on colored backgrounds)
  static const Color onPrimary = Colors.white;
  static const Color onSurface = Color(0xFF1C1B1F);
  static const Color onSurfaceDark = Color(0xFFE6E1E5);
  static const Color onSurfaceVariant = Color(0xFF49454F);
  static const Color onSurfaceVariantDark = Color(0xFFCAC4D0);

  // State colors
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorDark = Color(0xFFFFB4AB);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color errorContainerDark = Color(0xFF93000A);
  static const Color success = Color(0xFF2E7D32);
  static const Color successDark = Color(0xFF81C784);
  static const Color successContainer = Color(0xFFC8E6C9);
  static const Color warning = Color(0xFFFF8F00);
  static const Color warningDark = Color(0xFFFFB74D);
  static const Color warningContainer = Color(0xFFFFE0B2);

  // YouTube specific
  static const Color youtubeRed = Color(0xFFFF0000);
  static const Color youtubeDark = Color(0xFFCC0000);
  static const Color likeFilled = Color(0xFF065FD4);
  static const Color subscribedRed = Color(0xFFCC0000);

  // Neutral colors
  static const Color divider = Color(0xFFE0E0E0);
  static const Color dividerDark = Color(0xFF2C2C2C);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color disabledDark = Color(0xFF424242);

  // Overlay colors
  static Color scrim = Colors.black.withValues(alpha: 0.32);
  static Color overlay = Colors.black.withValues(alpha: 0.5);
  static Color overlayLight = Colors.black.withValues(alpha: 0.1);

  // Card colors
  static const Color cardLight = Colors.white;
  static const Color cardDark = Color(0xFF1E1E1E);
  static Color cardElevated = Colors.white;
  static Color cardElevatedDark = const Color(0xFF2D2D2D);

  // Interactive states
  static Color hoverLight = Colors.black.withValues(alpha: 0.04);
  static Color hoverDark = Colors.white.withValues(alpha: 0.08);
  static Color focusLight = Colors.black.withValues(alpha: 0.12);
  static Color focusDark = Colors.white.withValues(alpha: 0.12);
  static Color pressedLight = Colors.black.withValues(alpha: 0.12);
  static Color pressedDark = Colors.white.withValues(alpha: 0.12);

  // Shimmer gradients
  static LinearGradient get shimmerGradientLight => LinearGradient(
        colors: [
          Colors.grey.shade300,
          Colors.grey.shade200,
          Colors.grey.shade300,
        ],
        stops: const [0.0, 0.5, 1.0],
      );

  static LinearGradient get shimmerGradientDark => LinearGradient(
        colors: [
          Colors.grey.shade800,
          Colors.grey.shade700,
          Colors.grey.shade800,
        ],
        stops: const [0.0, 0.5, 1.0],
      );
}
