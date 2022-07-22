import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WV extends StatelessWidget {
  WV({Key? key, required this.ctrl}) : super(key: key);

  Function ctrl;

  @override
  Widget build(BuildContext context) {
    return WebView(
      javascriptChannels: <JavascriptChannel>{_channel(context)},
      onWebViewCreated: (c) {
        // c.loadFile('/assets/sample.html');
        c.loadFlutterAsset('assets/sample.html');

        ctrl(c);
      },
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  JavascriptChannel _channel(BuildContext context) {
    return JavascriptChannel(
        name: 'WV',
        onMessageReceived: (JavascriptMessage msg) {
          print("JS MSG :: ${msg.message}");
        });
  }
}
