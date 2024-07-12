// SPDX-FileCopyrightText: 2022 Iconica
//
// SPDX-License-Identifier: BSD-3-Clause

import "dart:math" as math;

import "package:auto_size_text/auto_size_text.dart";
import "package:flutter/material.dart";
import "package:flutter_animated_widgets/flutter_animated_widgets.dart";

class AnimatedNotificationBell extends StatefulWidget {
  const AnimatedNotificationBell({
    required this.duration,
    required this.notificationCount,
    required this.style,
    this.iterations = 5,
    super.key,
  }) : assert(
          iterations > 0,
          "Iterations needs to be above 0",
        );

  /// The number shown next to the bell.
  final int notificationCount;

  /// The total duration of the animation
  final Duration duration;

  /// Visual customization options.
  final AnimatedNotificationBellStyle style;

  /// The amount of swings of the bell. (default 5)
  ///
  /// With a [duration] of 1 second and 2 iterations it will each take 500 ms
  /// to complete a swing
  final int iterations;

  @override
  State<AnimatedNotificationBell> createState() =>
      _AnimatedNotificationBellState();
}

class _AnimatedNotificationBellState extends State<AnimatedNotificationBell>
    with TickerProviderStateMixin {
  late final AnimationController _notifyBellAnimationController;
  late final Animation<double> _notifyBellAnimation;
  late final Tween<double> _notifyBellTween;

  void _setupAnimation() {
    var bellAnimationCount = 0;
    var controller = AnimationController(
      vsync: this,
      duration: widget.duration ~/ widget.iterations,
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bellAnimationCount++;
        if (bellAnimationCount == widget.iterations) {
          _notifyBellAnimationController.reset();
          _notifyBellAnimationController.stop();
          _notifyBellTween.begin = -math.pi / 10;
          _notifyBellTween.end = 0;
          _notifyBellAnimationController.forward();
        } else if (bellAnimationCount == 1) {
          _notifyBellTween.begin = math.pi / 10;
          _notifyBellAnimationController.reverse();
        } else if (bellAnimationCount < widget.iterations) {
          _notifyBellAnimationController.reverse();
        } else {
          _notifyBellTween.begin = 0;
          _notifyBellTween.end = -math.pi / 10;
          _notifyBellAnimationController.reset();
          _notifyBellAnimationController.stop();
          bellAnimationCount = 0;
        }
      } else if (status == AnimationStatus.dismissed) {
        _notifyBellAnimationController.forward();
      }
    });

    _notifyBellTween = Tween<double>(begin: 0, end: -math.pi / 10);
    _notifyBellAnimation = _notifyBellTween.animate(controller);
    _notifyBellAnimationController = controller;
  }

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  @override
  void dispose() {
    _notifyBellAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _notifyBellAnimation,
        child: Stack(
          children: [
            Icon(
              widget.style.notificationIcon,
              size: widget.style.notificationIconSize,
            ),
            if (widget.notificationCount != 0) ...[
              if (widget.style.showNotificationCount) ...[
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: widget.style.amountCircleColor,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: widget.style.amountCircleSize,
                      maxHeight: widget.style.amountCircleSize,
                    ),
                    child: Center(
                      child: AutoSizeText(
                        widget.notificationCount >
                                widget.style.maxNotificationNumber
                            ? "${widget.style.maxNotificationNumber}+"
                            : "${widget.notificationCount}",
                        style: widget.style.amountCircleTextStyle,
                        textAlign: TextAlign.center,
                        minFontSize: 4,
                      ),
                    ),
                  ),
                ),
              ] else ...[
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: widget.style.amountCircleColor,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      maxWidth: widget.style.amountCircleSize,
                      maxHeight: widget.style.amountCircleSize,
                    ),
                  ),
                ),
              ],
            ],
          ],
        ),
        builder: (context, child) => Transform.rotate(
          alignment: Alignment.topCenter,
          angle: _notifyBellAnimation.value,
          child: child,
        ),
      );

  @override
  void didUpdateWidget(covariant AnimatedNotificationBell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.notificationCount < widget.notificationCount) {
      _notifyBellAnimationController.duration =
          widget.duration ~/ widget.iterations;
      _notifyBellAnimationController.forward();
    }
  }
}
