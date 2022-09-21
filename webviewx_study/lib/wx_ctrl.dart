import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

class WxCtrl extends GetxController {
  late WebViewXController webViewXController;

  void setCtrl(WebViewXController controller) {
    webViewXController = controller;
  }

  void dartCallJs() {
    webViewXController.callJsMethod('test', []);
  }
}
