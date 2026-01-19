import 'package:flutter/material.dart';
import 'animation_constants.dart';

/// A widget that animates list items with staggered entrance effects
/// Includes fade, slide, and optional scale animations
class AnimatedListItem extends StatefulWidget {
  const AnimatedListItem({
    super.key,
    required this.index,
    required this.child,
    this.duration = AppAnimations.medium,
    this.curve = AppAnimations.defaultCurve,
    this.slideOffset = AppAnimations.slideUpOffset,
    this.enableScale = false,
    this.scaleStart = 0.95,
    this.maxStaggerDelay = AppAnimations.maxStaggerDelayMs,
  });

  /// Index of the item in the list (used for stagger delay)
  final int index;

  /// The child widget to animate
  final Widget child;

  /// Duration of the animation
  final Duration duration;

  /// Curve for the animation
  final Curve curve;

  /// Initial offset for slide animation
  final Offset slideOffset;

  /// Whether to include scale animation
  final bool enableScale;

  /// Starting scale value (1.0 is full size)
  final double scaleStart;

  /// Maximum stagger delay in milliseconds
  final int maxStaggerDelay;

  @override
  State<AnimatedListItem> createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _slideAnimation = Tween<Offset>(
      begin: widget.slideOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    _scaleAnimation = Tween<double>(
      begin: widget.scaleStart,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    // Start animation after stagger delay
    final staggerDelay = AppAnimations.getStaggerDelay(
      widget.index,
      maxDelay: widget.maxStaggerDelay,
    );

    Future.delayed(staggerDelay, () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        Widget result = Transform.translate(
          offset: _slideAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: child,
          ),
        );

        if (widget.enableScale) {
          result = Transform.scale(
            scale: _scaleAnimation.value,
            child: result,
          );
        }

        return result;
      },
      child: widget.child,
    );
  }
}

/// A simpler version using implicit animations
/// Best for items that may rebuild frequently
class AnimatedListItemSimple extends StatefulWidget {
  const AnimatedListItemSimple({
    super.key,
    required this.child,
    this.duration = AppAnimations.medium,
    this.curve = AppAnimations.defaultCurve,
    this.slideOffset = 20.0,
  });

  final Widget child;
  final Duration duration;
  final Curve curve;
  final double slideOffset;

  @override
  State<AnimatedListItemSimple> createState() => _AnimatedListItemSimpleState();
}

class _AnimatedListItemSimpleState extends State<AnimatedListItemSimple> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Trigger animation on next frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() => _isVisible = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: widget.duration,
      curve: widget.curve,
      opacity: _isVisible ? 1.0 : 0.0,
      child: AnimatedSlide(
        duration: widget.duration,
        curve: widget.curve,
        offset: _isVisible ? Offset.zero : Offset(0, widget.slideOffset / 100),
        child: widget.child,
      ),
    );
  }
}

/// Extension to easily wrap any widget in an animated list item
extension AnimatedListExtension on Widget {
  Widget animateIn({
    required int index,
    Duration duration = AppAnimations.medium,
    Curve curve = AppAnimations.defaultCurve,
    bool enableScale = false,
  }) {
    return AnimatedListItem(
      index: index,
      duration: duration,
      curve: curve,
      enableScale: enableScale,
      child: this,
    );
  }
}
