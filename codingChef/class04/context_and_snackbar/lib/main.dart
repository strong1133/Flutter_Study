import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Builder(builder: (BuildContext context1) {
              return Container(
                color: Colors.amber,
                child: Column(children: <Widget>[
                  IconButton(
                      onPressed: () {
                        showSnackBar(context1, "1");
                      },
                      icon: Icon(Icons.ac_unit)),
                  Builder(builder: (BuildContext context2) {
                    return Container(
                      color: Colors.amber[100],
                      child: Column(children: <Widget>[
                        IconButton(
                            onPressed: () {
                              showSnackBar(context2, "2");
                            },
                            icon: Icon(Icons.ac_unit)),
                      ]),
                      width: 200.0,
                      height: 200.0,
                    );
                  })
                ]),
                width: 300.0,
                height: 300.0,
              );
            })
          ],
        ),
      ),
    );
  }
}

class ActionButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showSnackBar(context, "btn");
      },
      child: Icon(Icons.ac_unit),
    );
  }
}

void showSnackBar(BuildContext context, String loc) {
  Scaffold.of(context).showSnackBar(new SnackBar(
    backgroundColor: Colors.blue,
    content: Builder(builder: (context) {
      print(context.toString());
      return Text('Snack Bar on $loc');
    }),
    duration: Duration(seconds: 1),
  ));
}
