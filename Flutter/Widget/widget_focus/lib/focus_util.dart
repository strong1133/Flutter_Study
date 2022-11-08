import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FocusUtil {
  ///
  /// Global Key 에 해당하는 위젯으로 포커싱 이동
  static void focusWidgetByGlobalKey({required GlobalKey targetKey}) {



    Scrollable.ensureVisible(
      targetKey.currentContext!,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
