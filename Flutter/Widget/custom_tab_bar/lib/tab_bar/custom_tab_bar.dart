import 'dart:developer';

import 'package:custom_tab_bar/tab_bar/custom_indicator.dart';
import 'package:custom_tab_bar/tab_bar/linear_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin {
  List<String> tabList = ["tab1", "이름이 긴 녀석 !!!!! ~tab2", "tab3"];
  List<double> tabIndicatorWidthList = [];
  List<double> tabIndicatorPositionList = [];

  List<Widget> pageList = [
    Container(
      child: Text('page1'),
    ),
    Container(
      child: Text('page2'),
    ),
    Container(
      child: Text('page3'),
    ),
  ];

  int initialIdx = 0;

  late TabController tabController;
  late CustomIndicator indicator;

  @override
  void initState() {
    indicator = LinearIndicator(color: Colors.red, bottom: 3);
    indicator.setIndicatorWidthFromTabLabel(targetWidth: tabList[initialIdx].length * 6);
    tabIndicatorWidthList = List.filled(pageList.length, 0.0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [genTab(), genIndicator()
     
      ],
    );
  }

  Widget genTab() {
    List<Widget> _tabList = [];
    double gap = 10;
    double positionValue=gap;

    for (String title in tabList) {
        int idx = tabList.indexOf(title);
        int titleLen = title.length;
       

        tabIndicatorPositionList.add(positionValue);
        tabIndicatorWidthList[idx] = titleLen * 6;

        positionValue += (titleLen * 8.5) + (gap+gap * idx);

      _tabList.add(InkWell(
        onTap: () {
          moveTab(title, idx);
        },
        child: Container(
          width: title.length *8.5,
          child: Center(child: Text('$title'))),
      ));
    }

    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [..._tabList],
          ),
        ),
      ),
    );
  }

  Widget genIndicator() {
    return Positioned(
        bottom: indicator.bottom,
        left: indicator.left,
        child: Container(
          color: Colors.purple,
          width: indicator.width,
          height: indicator.height,
        ));
  }


  void moveTab(String title, int idx){
   setState(() {
      indicator.setIndicatorWidthFromTabLabel(targetWidth: tabIndicatorWidthList[idx]);
    
      indicator.left = tabIndicatorPositionList[idx];
   });
  }
}
