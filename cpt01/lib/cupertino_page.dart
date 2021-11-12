import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPage extends StatefulWidget {

  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        CupertinoButton(
            child:Text('쿠퍼티노 버튼'),
        )
      ],
    );
  }
}


