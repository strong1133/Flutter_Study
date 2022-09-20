import 'package:flutter/material.dart';
import 'package:flutter_grid/home.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(), body: Home(),),
    );
  }
}
