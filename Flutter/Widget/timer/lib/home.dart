import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer timer;
  late int time;

  @override
  void initState() {
    time = 180;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Center(child: Text('$time')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                go();
              },
              child: Text('Go')),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  time = 10;
                });
              },
              child: Text('Set'))
        ],
      ),
    );
  }

  void go() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (time > 0) {
        setState(() {
          time--;
        });
      }else{
        timer.cancel();
      }
    });
  }
}
