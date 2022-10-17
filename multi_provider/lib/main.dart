import 'package:flutter/material.dart';
import 'package:multi_provider/provider/home_provider.dart';
import 'package:multi_provider/provider/page_provider.dart';
import 'package:multi_provider/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(create: (context)=> HomeProvider()),
          ChangeNotifierProvider<PageProvider>(create: (context)=> PageProvider())
        ],
        child: const MaterialApp(
          home: Home(),
        ));
  }
}
