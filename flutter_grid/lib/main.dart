import 'package:flutter/material.dart';
import 'package:flutter_grid/grid2.dart';
import 'package:flutter_grid/grtid3.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(), body:Column(children: [  Grid3(width: 500, height: 500,)]),),
    );
  }
}
