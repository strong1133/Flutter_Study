import 'package:bottom_sheet_study/bottom_sheet_provider.dart';
import 'package:bottom_sheet_study/home2.dart';
import 'package:bottom_sheet_study/page_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({super.key});

  late BottomSheetProvider bottomSheetProvider;

  @override
  Widget build(BuildContext context) {
    print("Build");
    bottomSheetProvider = Provider.of<BottomSheetProvider>(context, listen: true);
    if (bottomSheetProvider.inner == null) {
      return SizedBox(
        height: bottomSheetProvider.hh,
        child: Center(
            child: Column(
          children: [
            Text('Move Page'),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(PageRouter().createRoute(Home2()));
                },
                child: Text('Home2')),
            SizedBox(
              height: 30.0,
            ),
            Text('Change Bottom Sheet'),
            ElevatedButton(
                onPressed: () {
                  change(context);
                  bottomSheetProvider.update();
                },
                child: Text('Change'))
          ],
        )),
      );
    } else {
      return bottomSheetProvider.inner!;
    }
  }

  void change(BuildContext context) {
    Widget tempWidget = SizedBox(
      height: 600.0,
      child: Center(
          child: Column(
        children: [
          Text('Is Changed'),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouter().createRoute(Home2()));
              },
              child: Text('Home2')),
        ],
      )),
    );

    bottomSheetProvider.setInner(tempWidget);
  }
}
