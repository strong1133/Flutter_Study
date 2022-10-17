import 'package:flutter/material.dart';
import 'package:multi_provider/widgets/buttons/default_btn.dart';

class GreenBtn extends StatelessWidget {
  double width;
  double padding;
  Function onClick;
  Widget child;

  GreenBtn(
      {required this.width,
      required this.padding,
      required this.onClick,
      required this.child,
      super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultBtn(width: width, padding: padding, color: Colors.green, onClick: onClick, child: child);
  }
}
