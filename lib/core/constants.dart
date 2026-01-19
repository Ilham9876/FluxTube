import 'package:flutter/cupertino.dart';

// Legacy spacing (kept for compatibility)
const kWidthBox5 = SizedBox(width: 5);
const kWidthBox10 = SizedBox(width: 10);
const kWidthBox15 = SizedBox(width: 15);
const kWidthBox20 = SizedBox(width: 20);

const kHeightBox5 = SizedBox(height: 5);
const kHeightBox10 = SizedBox(height: 10);
const kHeightBox15 = SizedBox(height: 15);
const kHeightBox20 = SizedBox(height: 20);
const kHeightBox30 = SizedBox(height: 30);

/// Semantic spacing system for consistent layouts
class AppSpacing {
  // Base spacing unit (4px)
  static const double unit = 4.0;

  // Spacing values
  static const double xxs = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double xxxl = 32.0;

  // SizedBox widgets for height spacing
  static const SizedBox height2 = SizedBox(height: xxs);
  static const SizedBox height4 = SizedBox(height: xs);
  static const SizedBox height8 = SizedBox(height: sm);
  static const SizedBox height12 = SizedBox(height: md);
  static const SizedBox height16 = SizedBox(height: lg);
  static const SizedBox height20 = SizedBox(height: xl);
  static const SizedBox height24 = SizedBox(height: xxl);
  static const SizedBox height32 = SizedBox(height: xxxl);

  // SizedBox widgets for width spacing
  static const SizedBox width2 = SizedBox(width: xxs);
  static const SizedBox width4 = SizedBox(width: xs);
  static const SizedBox width8 = SizedBox(width: sm);
  static const SizedBox width12 = SizedBox(width: md);
  static const SizedBox width16 = SizedBox(width: lg);
  static const SizedBox width20 = SizedBox(width: xl);
  static const SizedBox width24 = SizedBox(width: xxl);
  static const SizedBox width32 = SizedBox(width: xxxl);

  // Common EdgeInsets
  static const EdgeInsets paddingXs = EdgeInsets.all(xs);
  static const EdgeInsets paddingSm = EdgeInsets.all(sm);
  static const EdgeInsets paddingMd = EdgeInsets.all(md);
  static const EdgeInsets paddingLg = EdgeInsets.all(lg);
  static const EdgeInsets paddingXl = EdgeInsets.all(xl);

  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);

  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  // Screen padding (safe area)
  static const EdgeInsets screenPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );
}

/// Border radius constants
class AppRadius {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double full = 999.0;

  static const BorderRadius borderXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius borderSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius borderMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius borderLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius borderXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius borderFull = BorderRadius.all(Radius.circular(full));

  // Top-only radius (for bottom sheets)
  static const BorderRadius topMd = BorderRadius.vertical(top: Radius.circular(md));
  static const BorderRadius topLg = BorderRadius.vertical(top: Radius.circular(lg));
  static const BorderRadius topXl = BorderRadius.vertical(top: Radius.circular(xl));
}

/// Icon size constants
class AppIconSize {
  static const double xs = 16.0;
  static const double sm = 20.0;
  static const double md = 24.0;
  static const double lg = 28.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;
  static const double xxxl = 48.0;
}

/// Typography scale (font sizes)
class AppFontSize {
  static const double caption = 12.0;
  static const double body2 = 14.0;
  static const double body1 = 16.0;
  static const double subtitle = 18.0;
  static const double title = 20.0;
  static const double headline = 24.0;
  static const double display = 32.0;
}
