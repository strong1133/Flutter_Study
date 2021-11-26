import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('코딩쉐프 따라 잡기'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Hello1'),
            Text('Hello2'),
            Text('Hello3'),
          ],
        ),
      ),
    );
  }
}
