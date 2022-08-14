import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:life_cycle/home.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    print("ROOT BUILD > StatelessWidget");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [Home(),Home()],
        ),
      ),
    );
  }
}