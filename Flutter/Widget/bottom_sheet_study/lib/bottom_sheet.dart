import 'dart:developer';
import 'dart:ui';

import 'package:bottom_sheet_study/bottom_sheet_provider.dart';
import 'package:bottom_sheet_study/home2.dart';
import 'package:bottom_sheet_study/page_router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatefulWidget {
  CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> with SingleTickerProviderStateMixin {
  late BottomSheetProvider bottomSheetProvider;
  late AnimationController _controller;
  double curHeight = 400.0;
  double changeHeight = 400.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    curHeight = 400.0;
    changeHeight = curHeight;
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? lerp(double min, double max) {
    return lerpDouble(min, max, _controller.value);

    /// lerpDouble: Lㅋinearly interpolate between two numbers,
    /// `a` and `b`, by an extrapolation factor `t`.
    /// will help to change font,icon,image size,margin with _controller.value
  }

  void toggle() {
    log("CLICK");
    final bool isCompleted = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isCompleted ? -1 : 1);
    // curHeight
    /// velocity < 0.0 ? _AnimationDirection.reverse : _AnimationDirection.forward
    /// onTap open the sheet if it's closed and vise versa
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    bottomSheetProvider = Provider.of<BottomSheetProvider>(context, listen: true);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SizedBox(
            height: lerp(200, curHeight),
            child: Center(
                child: bottomSheetProvider.inner == null
                    ? Column(
                        children: [
                          Text('Move Page'),
                          ElevatedButton(
                              onPressed: () {
                                // Navigator.of(context).push(PageRouter().createRoute(Home2()));
                                toggle();
                              },
                              child: Text('Home2')),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text('Change Bottom Sheet'),
                          ElevatedButton(
                              onPressed: () {
                                toggle();
                                change(context);
                                // bottomSheetProvider.update();
                              },
                              child: Text('Change'))
                        ],
                      )
                    : Column(
                        children: [
                          Text('Is Changed'),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(PageRouter().createRoute(Home2()));
                              },
                              child: Text('Home2')),
                        ],
                      )));
      },
    );
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
