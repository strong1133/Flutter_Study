import 'dart:developer';

import 'package:chart_test/circle_chart.dart';
import 'package:chart_test/line_chart.dart';
import 'package:flutter/material.dart';

class AnimatedLineChart extends StatefulWidget {
  const AnimatedLineChart({super.key});

  @override
  State<AnimatedLineChart> createState() => _AnimatedLineChartState();
}

class _AnimatedLineChartState extends State<AnimatedLineChart> with SingleTickerProviderStateMixin {
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
    List<Map<String, dynamic>> valueMapList = [
      {"value": 30, "color": Colors.blue},
      {"value": 70, "color": Colors.purple},
      {"value": 90, "color": Colors.amber},
      {"value": 50, "color": Colors.red},
    ];
    return Container(
        child: Center(
      child: CustomPaint(size: Size(200, 200), painter: LineChart(valueList: valueMapList, textScaleFactor: 1.0, fraction: _fraction)),
    ));
  }
}
