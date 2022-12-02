import 'dart:math';

import 'package:flutter/material.dart';

class CircleChart extends CustomPainter {
  List<double> valueList = [];
  double textScaleFactor = 1.0;
  double fraction;

  CircleChart({
    required this.valueList,
    required this.textScaleFactor,
    required this.fraction,
  });

  List<Color> colorList = [Colors.blue, Colors.amber, Colors.green, Colors.purpleAccent];

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint(); // 화면에 그릴 Paint 정의

    paint
      ..color = Colors.grey // 선의 색상
      ..strokeWidth = 20.0 // 선의 길이
      ..style = PaintingStyle.stroke // 스타일 :: Stroke:외곽선, fill:다체움
      ..strokeCap = StrokeCap.round; // 끝처리

    double radius = min(size.width / 2 - paint.strokeWidth / 2, size.height / 2 - paint.strokeWidth / 2); // 원의 반지름을 구함. 선의 굵기에 영향을 받지않게 조정
    Offset center = Offset(size.width / 2, size.height / 2);

    valueList.sort(((b, a) => a.compareTo(b))); // 제일 큰 값을 가장 첫번째에 그림

    drawCircle(canvas, center, radius, paint); // 원을 그리는 부분

    // 전달받은 값의 양만큼 호를 그림
    for (double e in valueList) {
      int idx = valueList.indexOf(e);
      drawArc(canvas, center, radius, colorList[idx], paint, value: e);
    }

    drawText(canvas, size, "${valueList.length} / 100"); // 차트 라벨링
  }

  ///
  /// 원을 그려주는 함수.
  void drawCircle(Canvas canvas, Offset center, double radius, Paint paint) {
    canvas.drawCircle(center, radius, paint); // 원을 그리는 부분
  }

  ///
  /// 호를 그려주는 함수
  void drawArc(Canvas canvas, Offset center, double radius, Color arcColor, Paint paint, {required double value}) {
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
  bool shouldRepaint(CircleChart old) {
    return old.fraction != fraction;
  }
}
