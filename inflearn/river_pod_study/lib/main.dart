import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_study/riverpod/provider_observer.dart';
import 'package:river_pod_study/screen/home_screen.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger()
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
