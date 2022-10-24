import 'package:bottom_sheet_study/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Bottom Sheet'),),
        body: Home(),
      ),
    );
  }
}