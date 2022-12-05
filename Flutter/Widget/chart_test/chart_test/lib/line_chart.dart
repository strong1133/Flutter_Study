import 'dart:math';

import 'package:flutter/material.dart';

class LineChart extends CustomPainter {
  List<double> valueList = [];
  double textScaleFactor = 1.0;
  double fraction;

  LineChart({
    required this.valueList,
    required this.textScaleFactor,
    required this.fraction,
  });

  List<Color> colorList = [Colors.blue, Colors.amber, Colors.green, Colors.purpleAccent];

  List<Map<String, dynamic>> valueMapList = [
    {"value": 30, "color": Colors.blue},
    {"value": 70, "color": Colors.purple},
    {"value": 90, "color": Colors.amber},
    {"value": 50, "color": Colors.red},
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint(); // 화면에 그릴 Paint 정의

    paint
      ..color = Colors.grey // 선의 색상
      ..strokeWidth = 20.0 // 선의 길이
      ..style = PaintingStyle.stroke // 스타일 :: Stroke:외곽선, fill:다체움
      ..strokeCap = StrokeCap.round; // 끝처리

    valueMapList.sort(((b, a) => a['value'].compareTo(b['value']))); // 제일 큰 값을 가장 첫번째에 그림

    drawLine(canvas, size.width * 1, paint); // Base Line을 그리는 부분

    // 전달받은 값의 양만큼 호를 그림
    for (Map<String, dynamic> e in valueMapList) {
      paint.color = e['color'];
      drawLine(canvas, size.width * (e['value']/100), paint); // Bas
    }

    // drawText(canvas, size, "${valueList.length} / 100"); // 차트 라벨링
  }

  ///
  /// 선 그려주는 함수.
  void drawLine(Canvas canvas, double value, Paint paint) {
    canvas.drawLine(const Offset(0, 0), Offset(value, 0), paint);
  }

  ///
  /// 호를 그려주는 함수
  void drawValueLine(Canvas canvas, Offset center, double radius, Color arcColor, Paint paint, {required double value}) {
    double arcAngle = 2 * pi * (value / 100); // 호의 각도를 정함.
    paint.color = arcColor; // 호의 색

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle * fraction, false, paint); // 호를 그리는 부분
  }

  ///
  /// 원의 중앙에 텍스트를 적음.
  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);
    TextSpan sp = TextSpan(style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black), text: text);

    TextPainter tp = TextPainter(text: sp, textDirection: TextDirection.ltr);
    tp.layout(); // 필수! 텍스트 페인터에 그려질 텍스트의 크기와 방향를 정함.

    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;

    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  // 화면 크기에 비례하도록 텍스트 폰트 크기를 정함.
  double getFontSize(Size size, String text) {
    return size.width / text.length * textScaleFactor;
  }

  @override
  bool shouldRepaint(LineChart old) {
    return old.fraction != fraction;
  }
}
