import 'package:flutter/material.dart';
import 'dart:math';

import 'package:fluttertoast/fluttertoast.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDice = 1;
  int rightDice = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        title: Text('Dice Game'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Image.asset('assets/dice$leftDice.png')),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: Image.asset('assets/dice$rightDice.png')),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            ButtonTheme(
              minWidth: 100.0,
              height: 60.0,
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    leftDice = Random().nextInt(6) + 1;
                    rightDice = Random().nextInt(6) + 1;
                  });
                  showToast("Left Dice: $leftDice, Right Dice: $rightDice");
                },
                color: Colors.amber,
                child: Icon(
                  Icons.play_arrow,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM);
}
