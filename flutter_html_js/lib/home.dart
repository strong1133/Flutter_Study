import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dart:js' as js;

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
          ElevatedButton(
              onPressed: () {
                js.context.callMethod('alert', ['Call By 1']);
              },
              child: Text('Call Index Func'))
        ],
      ),
    );
  }
}
