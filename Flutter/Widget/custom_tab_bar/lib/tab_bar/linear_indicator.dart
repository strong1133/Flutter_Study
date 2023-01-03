import 'dart:ui';

import 'package:custom_tab_bar/tab_bar/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

class LinearIndicator extends CustomIndicator {
  final Color color;
  final double bottom;
  final BorderRadius? radius;
  final double height;
  double? width;

  LinearIndicator({required this.color, required this.bottom, this.height = 3.0, this.radius, this.width})
      : super(bottom: bottom, color: color, height: height, radius: radius, width: width);

  AnimationController? _animationController;
  late Animation _animation;

  // width getter & setter
  double? get getWidth => this.width;
  set setWidth(double? width) => this.width = width;

  void setIndicatorWidthFromTabLabel({required double targetWidth}) {
    this.width = targetWidth;
  }

  double getTabIndicatorCenterX(double width) {
    return width / 2;
  }

  @override
  void dispose() {
    _animationController?.stop(canceled: true);
  }

  @override
  void indicatorScrollToIndex(int index, List<Size>? sizeList, Duration duration, TickerProvider vsync, ValueNotifier<IndicatorPosition> notifier) {
    double left = notifier.value.left;
    double right = notifier.value.right;
    double width = 6;

    _animationController = AnimationController(duration: duration, vsync: vsync);
    _animation = Tween(begin: left, end: right).animate(_animationController!);

    _animationController!.forward();
  }

  @override
  void updateScrollIndicator(double? page, List<Size>? sizeList, Duration duration, ValueNotifier<IndicatorPosition> notifier) {}
}
