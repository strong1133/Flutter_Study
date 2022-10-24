import 'package:flutter/material.dart';

class BottomSheetProvider extends ChangeNotifier {
  double hh = 700.0;

  Widget? inner;
  void update() {
    hh = 200.0;
    notifyListeners();
  }

  void setInner(Widget _) {
    inner = _;

    notifyListeners();
  }
}
