import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Counter extends StatelessWidget {
  const Counter({required this.cnt, Key? key}) : super(key: key);
  final int cnt;

  @override
  Widget build(BuildContext context) {
    print("COUNTER BUILD > StatelessWidget");

    return Text('$cnt');

  }
}