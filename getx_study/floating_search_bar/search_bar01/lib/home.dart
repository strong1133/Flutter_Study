import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
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
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: homeBody(),
      ),
    ]);
  }

  Widget homeBody() {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: SafeArea(
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
                  Slider(),
                  Column(
                    children: [
                      Union(),
                    ],
                  ),
                ],
              ),
            ],
          ),
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

  Widget Slider() {
    return SlidingUpPanelWidget(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                blurRadius: 5.0,
                spreadRadius: 2.0,
                color: const Color(0x11000000))
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 8.0,
                    ),
                  ),
                  Text(
                    'click or drag',
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              height: 10.0,
            ),
            Divider(
              height: 0.5,
              color: Colors.grey[300],
            ),
            Flexible(
              child: Container(
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('list item $index'),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0.5,
                    );
                  },
                  shrinkWrap: true,
                  itemCount: 20,
                ),
                color: Colors.white,
              ),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
        ),
      ),
      controlHeight: 10.0,
      anchor: 0.4,
      panelController: panelController,
      onTap: () {
        ///Customize the processing logic
        if (SlidingUpPanelStatus.expanded == panelController.status) {
          panelController.collapse();
        } else {
          panelController.expand();
        }
      },
      enableOnTap: true, //Enable the onTap callback for control bar.
      dragDown: (details) {
        print('dragDown');
      },
      dragStart: (details) {
        print('dragStart');
      },
      dragCancel: () {
        print('dragCancel');
      },
      dragUpdate: (details) {
        print(
            'dragUpdate,${panelController.status == SlidingUpPanelStatus.dragging ? 'dragging' : ''}');
      },
      dragEnd: (details) {
        print('dragEnd');
      },
    );
  }
}
