import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Instance Test'),),
          body: Center(
            child:  Column(
              children: [
                Text('home')
              ],
            ),
          ),
        ),
      );
  }
}