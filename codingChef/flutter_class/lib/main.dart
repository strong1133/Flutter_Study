import 'package:flutter/material.dart';
import 'package:flutter_class/my_card.dart';
import 'my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '코딩쉐프 카드만들기',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyCard(),
    );
  }
}
