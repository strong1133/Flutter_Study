import 'dart:developer';
import 'dart:ffi';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late bool isExpanded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text('asd'),
        Container(
            color: Colors.deepOrange,
            width: 200,
            child: Column(
              children: [
                ExpandablePanel(
                  theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      hasIcon: true,
                      tapBodyToCollapse: true,
                      tapBodyToExpand: true,
                      iconPadding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      iconSize: 24,
                      iconColor: Colors.amber),
                  header: const Text('Header'),
                  collapsed: const Text(''),
                  expanded: Container(width: double.maxFinite, height: 100, child: const Text('내용내용내용')),
                ),
                ExpandablePanel(
                  theme: ExpandableThemeData(
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      hasIcon: true,
                      tapBodyToCollapse: true,
                      tapBodyToExpand: true,
                      iconPadding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      iconSize: 24,
                      iconColor: Colors.amber),
                  header: const Text('Header'),
                  collapsed: const Text(''),
                  expanded: Container(width: double.maxFinite, height: 100, color: Colors.grey, child: const Text('내용내용내용')),
                ),
              ],
            )),
      ],
    ));
  }
}
