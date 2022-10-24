import 'package:bottom_sheet_study/bottom_sheet_provider.dart';
import 'package:bottom_sheet_study/home.dart';
import 'package:flutter/material.dart';
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
        ChangeNotifierProvider<BottomSheetProvider>(
              create: (context) => BottomSheetProvider()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Bottom Sheet'),),
          body: Home(),
        ),
      ),
    );
  }
}