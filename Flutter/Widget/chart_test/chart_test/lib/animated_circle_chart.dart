import 'dart:developer';

import 'package:chart_test/circle_chart.dart';
import 'package:flutter/material.dart';

class AnimatedCircleChart extends StatefulWidget {
  const AnimatedCircleChart({super.key});

  @override
  State<AnimatedCircleChart> createState() => _AnimatedCircleChartState();
}

class _AnimatedCircleChartState extends State<AnimatedCircleChart> with SingleTickerProviderStateMixin {
  double _fraction = 0.0;
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        log(animation.value.toString());
        setState(() {
          _fraction = animation.value;
        });
      });
    animationController.repeat(max: 1);
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: CustomPaint(
        size: Size(150, 150),
        painter: CircleChart(textScaleFactor: 1.0, valueList: [22.0, 30.0, 62.0], fraction: _fraction),
      ),
    ));
  }
}
