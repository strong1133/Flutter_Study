import 'dart:developer';

import 'package:dio_study/home.dart';
import 'package:dio_study/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) => ErrorLogger().errorLog(errorDetails: details);
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

class ErrorLogger {
  void errorLog({required FlutterErrorDetails errorDetails}) {
    log("@@@@ ERROR LOG @@@@");
    log(errorDetails.toString());
  }
}
