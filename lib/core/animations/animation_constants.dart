import 'package:flutter/material.dart';

/// App-wide animation constants for consistent timing and curves
class AppAnimations {
  // Durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration stagger = Duration(milliseconds: 50);
  static const Duration pageTransition = Duration(milliseconds: 350);

  // Curves
  static const Curve defaultCurve = Curves.easeOutCubic;
  static const Curve bounceCurve = Curves.easeOutBack;
  static const Curve springCurve = Curves.elasticOut;
  static const Curve sharpCurve = Curves.easeInOutCubic;

  // Spring physics for draggable sheets and bouncy animations
  static const SpringDescription sheetSpring = SpringDescription(
    mass: 1.0,
    stiffness: 500.0,
    damping: 30.0,
  );

  static const SpringDescription buttonSpring = SpringDescription(
    mass: 1.0,
    stiffness: 800.0,
    damping: 25.0,
  );

  // Scale values
  static const double pressedScale = 0.92;
  static const double hoverScale = 1.02;

  // Opacity values
  static const double fadedOpacity = 0.0;
  static const double visibleOpacity = 1.0;

  // Slide offsets
  static const Offset slideUpOffset = Offset(0, 20);
  static const Offset slideDownOffset = Offset(0, -20);
  static const Offset slideRightOffset = Offset(-20, 0);

  // Max stagger delay to prevent too long delays for large lists
  static const int maxStaggerDelayMs = 500;

  /// Calculate stagger delay for list items
  static Duration getStaggerDelay(int index, {int maxDelay = maxStaggerDelayMs}) {
    final delay = index * stagger.inMilliseconds;
    return Duration(milliseconds: delay.clamp(0, maxDelay));
  }
}
