import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  String? profile = const String.fromEnvironment('env');
  String env = kReleaseMode ? 'prod' : 'dev';
  print("PROFILE $profile");
  print("ENV $env");

  if (env != 'prod' && profile != '') {
    env = profile;
  }
  await dotenv.load(fileName: "assets/.env.$env"); // env 파일 로드
  print(".env.$env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home());
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dot Env'),
      ),
      body: Center(
        child: Column(
          children: [Text('HOME'), Text(dotenv.get("NAME"))],
        ),
      ),
    );
  }
}
