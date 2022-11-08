import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:widget_focus/focus_util.dart';

class HomeProvider extends ChangeNotifier {
  Map globalKeyMap = {};
  List textList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
  ];
 

  

  void getFocus({required String target}) {
    FocusUtil.focusWidgetByGlobalKey(targetKey: globalKeyMap[target]);
  }
}
