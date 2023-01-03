import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>  with TickerProviderStateMixin {

  List tabList = ["tab1","이름이 긴 녀석 !!!!! ~tab2","tab3"];

  List<Widget> pageList = [
    Container(child: Text('page1'),), 
    Container(child: Text('page2'),),
    Container(child: Text('page3'),),
  
  ];

  int initialIdx = 2;
  
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          genTab()
        ],
      ),
    );
  }

  Widget genTab(){

    List<Widget> _tabList = [];

    for(String title in tabList ){
      _tabList.add(
        InkWell(
          onTap: (){
            log("tab");
          },
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: 60.0),
          child: Center(child: Text(title)),
              ),
        ));
    }

   return Container(
    height: 50,
    color: Colors.amber,
      child: Row(
        children: [..._tabList],
      ),
    );
  }
}