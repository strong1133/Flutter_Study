import 'dart:math';

import 'package:flutter/material.dart';

class LineChart extends CustomPainter {
  List<Map<String, dynamic>> valueList;
  double textScaleFactor = 1.0;
  double fraction;

  LineChart({
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

    valueList.sort(((b, a) => a['value'].compareTo(b['value']))); // 제일 큰 값을 가장 첫번째에 그림

    drawLine(canvas, size.width * 1, paint); // Base Line을 그리는 부분

    // 전달받은 값의 양만큼 선을 그림
    for (Map<String, dynamic> e in valueList) {
      paint.color = e['color'];
      drawLine(canvas, (size.width * (e['value'] / 100)) * fraction, paint); // Bas
    }

    // drawText(canvas, size, "${valueList.length} / 100"); // 차트 라벨링
  }

  ///
  /// 선 그려주는 함수.
  void drawLine(Canvas canvas, double value, Paint paint) {
    canvas.drawLine(const Offset(0, 0), Offset(value, 0), paint);
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
