import 'package:flutter/material.dart';
import 'package:flutter_grid/grid2.dart';
import 'package:flutter_grid/grtid3.dart';
import 'package:flutter_grid/grtid3_fc.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(), body:Center(child: Column(children: [  Grid3Fc(width: 450, height: 450,)])),),
    );
  }
}
