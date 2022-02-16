import 'package:flutter/material.dart';

import 'search_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: homeBody(),
    );
  }

  Widget homeBody() {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: [
            Stack(
              children: [Text('asd'), SearchBarCustom()],
            )
          ],
        ));
  }
}
