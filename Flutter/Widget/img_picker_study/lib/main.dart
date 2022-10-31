import 'package:flutter/material.dart';
import 'package:img_picker_study/home.dart';

void main() {
  runApp( App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Img Picker Test'),),
        body: Home(),
      ),
    );
  }
}