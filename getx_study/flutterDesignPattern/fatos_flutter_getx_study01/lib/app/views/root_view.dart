import 'package:fatos_flutter_getx_study01/app/views/search_view.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fatos Study'),
      ),
      body: SearchPage(),
    );
  }
}
