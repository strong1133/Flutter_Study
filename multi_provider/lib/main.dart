import 'package:flutter/material.dart';
import 'package:multi_provider/provider/home_provider.dart';
import 'package:multi_provider/provider/page_provider.dart';
import 'package:multi_provider/provider/singleton.dart';
import 'package:multi_provider/view/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});
  Singleton singleton = Singleton();

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
              create: (context) => HomeProvider()),
          ChangeNotifierProvider<PageProvider>(
              create: (context) => PageProvider())
        ],
        child: MaterialApp(
          home:  Builder(
            builder: (context) {
              singleton.setContext(context: context);
              return Home();
            }
          ),
        ));
  }
}
