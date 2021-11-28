import 'package:flutter/material.dart';
import 'package:login_challenge/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Login(),
    );
  }
}
