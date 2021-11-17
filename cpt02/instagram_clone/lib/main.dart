import 'package:flutter/material.dart';
import 'package:instagram_clone/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
          ),
          accentColor: Colors.black,
        ),
        home: RootPage());
  }
}
