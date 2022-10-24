import 'package:bottom_sheet_study/home2.dart';
import 'package:bottom_sheet_study/page_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('HOME1'),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return bs(context);
                    });
              },
              child: Text('Btn'))
        ],
      ),
    );
  }

  Widget bs(BuildContext context) {
    return Container(
        height: 300.0,
        child: Center(
          child: Column(
            children: [
              Text('Bottom Sheet'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(PageRouter().createRoute(Home2()));
                  },
                  child: Text('Home2'))
            ],
          ),
        ));
  }
}
