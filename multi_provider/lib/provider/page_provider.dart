import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int pageIdx = 0;
  late TabController tabController;

  int get getPageIdx => pageIdx;

  void injectTabController({required TabController tabController}) {
    this.tabController = tabController;
    this.tabController.addListener(() {
      pageObs();
    });
  }

  void changePage({required int idx}) {
    pageIdx = idx;
    tabController.animateTo(idx);
    notifyListeners();
  }

  void pageObs() {
    pageIdx = tabController.index;
    notifyListeners();
  }
}
