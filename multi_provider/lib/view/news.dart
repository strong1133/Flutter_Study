import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multi_provider/provider/home_provider.dart';
import 'package:multi_provider/widgets/buttons/green_btn.dart';
import 'package:multi_provider/widgets/buttons/red_btn.dart';
import 'package:provider/provider.dart';

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return Container(
      child: Center(
        child: Column(
          children: [
            Text('News'),
            GreenBtn(
                onClick: () {
                  homeProvider.navibarShow();
                },
                padding: 10,
                width: 100,
                child: const Text('Enable')),
            RedBtn(
                onClick: () {
                  homeProvider.navibarHide();
                },
                padding: 10,
                width: 100,
                child: const Text('Disable'))
          ],
        ),
      ),
    );
  }
}
