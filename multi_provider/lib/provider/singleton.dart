import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Singleton {
  BuildContext? buildContext;
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  Singleton._internal() {
    log("Singleton Instance Created");
  }

  // BuildContext 주입
  void setContext({required BuildContext context}) {
    buildContext = context;
  }

  // Sington Provider DI
  T diProvider<T>(t){
    log("Provider Type :: ${t}");
    return Provider.of<T>(buildContext!);
  }
}

