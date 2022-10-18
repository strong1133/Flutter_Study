import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multi_provider/provider/home_provider.dart';
import 'package:multi_provider/provider/page_provider.dart';
import 'package:multi_provider/view/news.dart';
import 'package:multi_provider/view/plus.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // PageProvider에 주입 하기 위한 controller 생성
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    pageProvider.injectTabController(tabController: _tabController);

    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
        controller: pageProvider.tabController,
        children: [News(), Plus()],
      ),
      bottomNavigationBar: Visibility(
        visible: homeProvider.getNaviBarVisibleFlag,
        child: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          currentIndex: pageProvider.getPageIdx,
          items: const [
            BottomNavigationBarItem(label: 'news', icon: Icon(Icons.article)),
            BottomNavigationBarItem(label: 'plus', icon: Icon(Icons.add)),
          ],
          onTap: (int idx) {
            pageProvider.changePage(idx: idx);
          },
        ),
      ),
    );
  }
}
