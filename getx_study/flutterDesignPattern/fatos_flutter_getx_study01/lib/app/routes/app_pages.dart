import 'package:fatos_flutter_getx_study01/app/views/home_root_view.dart';
import 'package:fatos_flutter_getx_study01/app/views/root_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          middlewares: [],
          name: _Paths.HOME,
          page: () => HomeRootView(),
          transition: Transition.noTransition,
        ),
      ],
    ),
  ];
}
