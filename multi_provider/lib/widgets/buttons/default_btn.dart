import 'package:flutter/material.dart';

class DefaultBtn extends StatelessWidget {
  double width;
  double padding;
  Color color;
  Function onClick;
  Widget child;

  DefaultBtn(
      {required this.width,
      required this.padding,
      required this.color,
      required this.onClick,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: color),
          onPressed: () {
            onClick();
          },
          child: child),
    );
  }
}
