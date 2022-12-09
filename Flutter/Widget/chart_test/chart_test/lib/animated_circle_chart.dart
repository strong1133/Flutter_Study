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
    List<Map<String, dynamic>> valueMapList = [
      {"value": 30.0, "color": Colors.blue},
      {"value": 70.0, "color": Colors.purple},
      {"value": 90.0, "color": Colors.amber},
      {"value": 50.0, "color": Colors.red},
      {"value": 20.0, "color": Colors.black},
    ];
    return Container(
        child: Center(
      child: CustomPaint(
        size: Size(150, 150),
        painter: CircleChart(textScaleFactor: 1.0, valueList: valueMapList, fraction: _fraction),
      ),
    ));
  }
}

