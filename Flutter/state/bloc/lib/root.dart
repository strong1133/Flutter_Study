import 'package:bloc/home.dart';
import 'package:bloc/home2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("ROOT BUILD");
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Home(),
              Divider(),
              Home2()
            ],
          )
        ),
      );
  }
}