import 'package:dio_study/home.dart';
import 'package:dio_study/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(create: (context) => HomeProvider()),
        ],
        child: Scaffold(
          body: Home(),
        ),
      ),
    );
  }
}
