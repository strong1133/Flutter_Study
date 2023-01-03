import 'package:flutter/material.dart';

abstract class CustomIndicator {
  final Color color;
   double left;
  final double right;
  final double? top;
  final double bottom;
  final double height;
  final double? width;
  final BorderRadius? radius;

  CustomIndicator({this.bottom = 0, this.top, this.right = 0, this.left = 0, this.width, required this.color, required this.height, this.radius});

  void updateScrollIndicator(double? page, List<Size>? sizeList, Duration duration, ValueNotifier<IndicatorPosition> notifier);

  void indicatorScrollToIndex(int index, List<Size>? sizeList, Duration duration, TickerProvider vsync, ValueNotifier<IndicatorPosition> notifier);

  void setIndicatorWidthFromTabLabel({required double targetWidth});

  void dispose();
}

class IndicatorPosition {
  final double left;
  final double right;
  final double top;
  final double bottom;
  const IndicatorPosition(this.left, this.right, this.top, this.bottom);
}
