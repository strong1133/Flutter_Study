import 'dart:developer';

import 'package:chart_test/circle_chart.dart';
import 'package:flutter/material.dart';

class CustomChart extends StatefulWidget {
  const CustomChart({super.key});

  @override
  State<CustomChart> createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> with SingleTickerProviderStateMixin {
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
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
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
        painter: CircleChart(textScaleFactor: 1.0, percentage: 40, fraction:_fraction),
      ),
    ));
  }
}
