import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:search_bar01/search_controller.dart';
import 'package:search_bar01/search_result_list.dart';

import 'search_bar.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: homeBody(),
    );
  }

  Widget homeBody() {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: Column(
          children: [
            Stack(
              children: [
                Text('asd'),
                ButtonTheme(
                  padding: EdgeInsets.zero,
                  minWidth: 840,
                  height: 850,
                  child: RaisedButton(
                    onPressed: () {
                      searchController.closser();
                      print(searchController.isLoading);
                    },
                    color: Colors.blue,
                    child: Icon(
                      Icons.play_arrow,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  children: [Union()],
                ),
              ],
            ),
          ],
        ));
  }

  Widget Union() {
    return GetBuilder<SearchController>(builder: (searchController) {
      return Visibility(
          child: Column(
        children: [
          SearchBarCustom(),
          Visibility(visible: searchController.open, child: SearchResultList()),
        ],
      ));
    });
  }
}
