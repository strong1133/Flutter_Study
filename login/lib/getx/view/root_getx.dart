import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';


class RootGetX extends StatelessWidget {
  const RootGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('GETX'),
        ),
        body: Login(),
      ),
    );
  }
}
