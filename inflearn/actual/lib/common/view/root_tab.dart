import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  late TabController tabController;
    int idx = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(tabListhener);
  }

  void tabListhener(){
    setState(() {
      idx = tabController.index;
    });
  }

  @override
  void dispose() {
    tabController.removeListener(tabListhener);
    // TODO: implement dispose
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: '코팩 딜리버리',
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: BODY_TEXT_COLOR,
            selectedItemColor: PRIMARY_COLOR,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            type: BottomNavigationBarType.fixed,
            onTap: (int idx) {
              tabController.animateTo(idx);
            },
            currentIndex: idx,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: '홈'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.fastfood_outlined), label: '음식'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.receipt_long_outlined), label: '주문'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.percent_outlined), label: '프로필'),
            ]),
        child: TabBarView(controller: tabController, children: [
          Container(
            child: Center(child: Text('홈')),
          ),
          Container(child: Center(child: Text('음식'))),
          Container(child: Center(child: Text('주문'))),
          Container(child: Center(child: Text('프로필'))),
        ]));
  }
}
