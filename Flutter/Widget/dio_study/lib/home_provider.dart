import 'package:dio/dio.dart';
import 'package:dio_study/dio_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  DioService dioService = DioService();

  String URI_PREFIX = 'http://localhost:8080';

  String token = '';
  List<String> users = [];

  void getUsers({required BuildContext buildContext}) async {
    String apiUrl = '$URI_PREFIX/users';
    Response? res;

    try {
      res = await dioService.dio.get(apiUrl);
    } catch (e) {}

    print(res);
  }
}
