import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('현재 카운트는?'),
              Padding(padding: EdgeInsets.all(10.0)),
              Text('$counter', style: Theme.of(context).textTheme.headline2),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  counter++;
                  print(counter);
                });
              },
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            FloatingActionButton(
              child: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  counter--;
                  print(counter);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
