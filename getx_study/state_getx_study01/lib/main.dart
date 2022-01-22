import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_getx_study01/controller/counterController.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  CounterController controller = new CounterController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber[200]),
      home: Home(),
    );
  }
}
