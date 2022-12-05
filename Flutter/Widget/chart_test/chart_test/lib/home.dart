import 'package:chart_test/circle_chart.dart';
import 'package:chart_test/animated_circle_chart.dart';
import 'package:chart_test/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text('data'),
            SizedBox(
              height: 50,
            ),
            AnimatedCircleChart(),
            SizedBox(height: 50,),

            CustomPaint(
              size: Size(200, 200),
              painter:    LineChart(valueList: [20,34], textScaleFactor: 1.0, fraction: 1),
            )
         
          ],
        ),
      ),
    );
  }
}
