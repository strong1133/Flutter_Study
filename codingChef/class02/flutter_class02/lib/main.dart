import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AppBar Icon Menu"),
        centerTitle: true,
        elevation: 0.0,

        //AppBar 왼쪽에 버튼이 생김
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            print("Menu Button is Clicked");
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print("shopping_cart Button is Clicked");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("search Button is Clicked");
            },
          ),
        ],
      ),
    );
  }
}
