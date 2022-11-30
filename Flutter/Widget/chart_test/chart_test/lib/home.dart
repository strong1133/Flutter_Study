import 'package:chart_test/circle_chart.dart';
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
            Center(
              child: CustomPaint(
                size: Size(150, 150),
                painter: CircleChart(
                  textScaleFactor: 1.0,
                  percentage: 50
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
