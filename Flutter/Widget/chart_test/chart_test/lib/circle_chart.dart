import 'dart:math';

import 'package:flutter/material.dart';

class CircleChart extends CustomPainter {
  int percentage = 0;
  double textScaleFactor = 1.0;

  CircleChart({
    required this.percentage,
    required this.textScaleFactor
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint(); // 화면에 그릴 Paint 정의

    paint
      ..color = Colors.grey // 선의 색상
      ..strokeWidth = 15.0 // 선의 길이
      ..style = PaintingStyle.stroke // 스타일 :: Stroke:외곽선, fill:다체움
      ..strokeCap = StrokeCap.round; // 끝처리

    double radius = min(size.width / 2 - paint.strokeWidth / 2, size.height / 2 - paint.strokeWidth / 2); // 원의 반지름을 구함. 선의 굵기에 영향을 받지않게 조정
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint); // 원을 그리는 부분

    double arcAngle = 2 * pi * (percentage / 100); // 호의 각도를 정함.
    paint.color = Colors.deepPurpleAccent; // 호의 색

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, arcAngle, false, paint); // 호를 그리는 부분

    drawText(canvas, size, "$percentage / 100");
  }

  // 원의 중앙에 텍스트를 적음.
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
  bool shouldRepaint(CircleChart old) {
    return old.percentage != percentage;
  }
}
