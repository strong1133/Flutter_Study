import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_html_js/wv.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  var controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text('Home'),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 200,
            height: 200,
            child: WV(
              ctrl: (c) {
                controller = c;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                print(await controller.evaluateJavascript(''' hello();'''));
              },
              child: Text('Call Index Func')),
        ],
      ),
    );
  }
}
