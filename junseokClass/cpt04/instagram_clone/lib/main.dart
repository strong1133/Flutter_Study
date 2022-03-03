import 'package:flutter/material.dart';
import 'package:instagram_clone/root_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InstaGram Clone",
      theme: ThemeData(
        primaryColor: Colors.teal,
        appBarTheme: AppBarTheme(color: Colors.amber),
      ),
      home: RootPage(),
    );
  }
}
