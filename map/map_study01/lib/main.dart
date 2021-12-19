import 'package:flutter/material.dart';

import 'loading.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MVT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Loading());
  }
}
