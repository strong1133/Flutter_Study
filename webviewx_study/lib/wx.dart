import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webviewx/webviewx.dart';

class WX extends StatefulWidget {

  Function? callback;
  WX({this.callback, Key? key}) : super(key: key);

  @override
  State<WX> createState() => _WXState();
}

class _WXState extends State<WX> {
  @override
  Widget build(BuildContext context) {
    return WebViewX(
        width: 1200,
        height: 600,
        initialSourceType: SourceType.html,
        onWebViewCreated: (controller) async {
          await controller.loadContent('web/test.html', SourceType.html, fromAssets: true);
          if(widget.callback != null){
            widget.callback!(controller);
          }
        });
  }
}
