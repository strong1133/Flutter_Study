import 'package:fatos_flutter_getx_study01/app/routes/app_pages.dart';
import 'package:fatos_flutter_getx_study01/app/views/root_view.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:easy_localization/easy_localization.dart';

// 언어팩 지정
// final supportedLocales = [Locale('en', 'US'), Locale('ko', 'KR')];

// Future<void> initAppBindings() async {
//   // WidgetsFlutterBinding.ensureInitialized();
//   EasyLocalization.ensureInitialized();
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      getPages: AppPages.routes,
    );
  }
}
