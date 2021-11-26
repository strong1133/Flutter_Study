import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BBANTO'),
        centerTitle: true, // 가운데 정렬
        backgroundColor: Colors.redAccent,
        elevation: 0.0, // Floating 효과를 조절할 수 있음.
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Hello1'),
              Text('Hello2'),
              Text('Hello3'),
            ]),
      ),
    );
  }
}
