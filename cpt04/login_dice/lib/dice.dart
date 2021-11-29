import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
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
                  Expanded(child: Image.asset('assets/dice1.png')),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(child: Image.asset('assets/dice2.png')),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
