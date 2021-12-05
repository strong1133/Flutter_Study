import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final wordPair = WordPair.random();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Challenge01",
      home: Scaffold(
        appBar: AppBar(
          title: const Text('플러터 첼린지 1'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
