import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_getx_study01/home_obs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX And Calendar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.amber[200]),
      // home: Home(),
      home: Home_obs(),
    );
  }
}