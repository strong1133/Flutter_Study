import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webviewx/webviewx.dart';

class WX extends StatefulWidget {
  const WX({Key? key}) : super(key: key);

  @override
  State<WX> createState() => _WXState();
}

class _WXState extends State<WX> {
  @override
  Widget build(BuildContext context) {
    return WebViewX(
        width: 400,
        height: 400,
        initialSourceType: SourceType.html,
        onWebViewCreated: (controller) async {
          await controller.loadContent('web/test.html', SourceType.html, fromAssets: true);
          controller.callJsMethod('test', []);
        });
  }
}
