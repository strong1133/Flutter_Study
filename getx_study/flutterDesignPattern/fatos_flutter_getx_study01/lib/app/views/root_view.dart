import 'package:fatos_flutter_getx_study01/app/controllers/root_controller.dart';
import 'package:fatos_flutter_getx_study01/app/routes/app_pages.dart';
import 'package:fatos_flutter_getx_study01/app/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      builder: (context, delegate, currentRoute) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Root'),
          ),
          body: GetRouterOutlet(
            // key: Get.nestedKey(Routes.ROOT),
            initialRoute: Routes.ROOT,
            anchorRoute: Routes.ROOT,
            filterPages: (afterAnchor) {
              return afterAnchor.take(1);
            },
          ),
        );
      },
    );
  }
}
