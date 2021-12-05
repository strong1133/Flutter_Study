import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Context & SnackBar'),
        ),
        floatingActionButton: ActionButtonExample(),
      ),
    );
  }
}

class ActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(new SnackBar(
          backgroundColor: Colors.blue,
          content: Builder(builder: (context) {
            return Text('Snack Bar');
          }),
        ));
      },
      child: Icon(Icons.ac_unit),
    );
  }
}
