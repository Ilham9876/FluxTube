import 'package:flutter/material.dart';
import 'animation_constants.dart';

/// A widget that combines fade and slide animations for smooth transitions
/// Useful for content that appears/disappears or state changes
class FadeSlideTransition extends StatefulWidget {
  const FadeSlideTransition({
    super.key,
    required this.child,
    this.isVisible = true,
    this.duration = AppAnimations.medium,
    this.curve = AppAnimations.defaultCurve,
    this.slideDirection = SlideDirection.up,
    this.slideDistance = 20.0,
    this.onAnimationComplete,
  });

  final Widget child;
  final bool isVisible;
  final Duration duration;
  final Curve curve;
  final SlideDirection slideDirection;
  final double slideDistance;
  final VoidCallback? onAnimationComplete;

  @override
  State<FadeSlideTransition> createState() => _FadeSlideTransitionState();
}

enum SlideDirection { up, down, left, right }

class _FadeSlideTransitionState extends State<FadeSlideTransition>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: widget.isVisible ? 1.0 : 0.0,
    );

    _setupAnimations();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        widget.onAnimationComplete?.call();
      }
    });
  }

  void _setupAnimations() {
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));

    final offset = _getOffset();
    _slideAnimation = Tween<Offset>(
      begin: offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    ));
  }

  Offset _getOffset() {
    switch (widget.slideDirection) {
      case SlideDirection.up:
        return Offset(0, widget.slideDistance);
      case SlideDirection.down:
        return Offset(0, -widget.slideDistance);
      case SlideDirection.left:
        return Offset(widget.slideDistance, 0);
      case SlideDirection.right:
        return Offset(-widget.slideDistance, 0);
    }
  }

  @override
  void didUpdateWidget(FadeSlideTransition oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isVisible != oldWidget.isVisible) {
      if (widget.isVisible) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }

    if (widget.slideDirection != oldWidget.slideDirection ||
        widget.slideDistance != oldWidget.slideDistance) {
      _setupAnimations();
    }
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
        return Transform.translate(
          offset: _slideAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}

/// A widget for animating content changes with cross-fade and slide
class AnimatedContentSwitcher extends StatelessWidget {
  const AnimatedContentSwitcher({
    super.key,
    required this.child,
    this.duration = AppAnimations.medium,
    this.slideDirection = SlideDirection.up,
    this.slideDistance = 10.0,
  });

  final Widget child;
  final Duration duration;
  final SlideDirection slideDirection;
  final double slideDistance;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: AppAnimations.defaultCurve,
      switchOutCurve: AppAnimations.defaultCurve,
      transitionBuilder: (child, animation) {
        final offset = _getOffset();
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: offset,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  Offset _getOffset() {
    switch (slideDirection) {
      case SlideDirection.up:
        return Offset(0, slideDistance / 100);
      case SlideDirection.down:
        return Offset(0, -slideDistance / 100);
      case SlideDirection.left:
        return Offset(slideDistance / 100, 0);
      case SlideDirection.right:
        return Offset(-slideDistance / 100, 0);
    }
  }
}

/// Simple implicit animation version
class FadeSlideIn extends StatefulWidget {
  const FadeSlideIn({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = AppAnimations.medium,
    this.curve = AppAnimations.defaultCurve,
    this.slideDirection = SlideDirection.up,
    this.slideDistance = 20.0,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final SlideDirection slideDirection;
  final double slideDistance;

  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.delay, () {
      if (mounted) {
        setState(() => _isVisible = true);
      }
    });
  }

  Offset get _beginOffset {
    final d = widget.slideDistance / 100;
    switch (widget.slideDirection) {
      case SlideDirection.up:
        return Offset(0, d);
      case SlideDirection.down:
        return Offset(0, -d);
      case SlideDirection.left:
        return Offset(d, 0);
      case SlideDirection.right:
        return Offset(-d, 0);
    }
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
        offset: _isVisible ? Offset.zero : _beginOffset,
        child: widget.child,
      ),
    );
  }
}
