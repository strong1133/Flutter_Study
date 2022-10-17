import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool naviBarVisibleFlag = true;

  bool get getNaviBarVisibleFlag => naviBarVisibleFlag;

  void navibarShow() {
    naviBarVisibleFlag = true;
    notifyListeners();
  }

  void navibarHide() {
    naviBarVisibleFlag = false;
    notifyListeners();
  }
}
