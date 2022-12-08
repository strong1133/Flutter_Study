import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_study/dio_dto.dart';
import 'package:dio_study/dio_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  DioService dioService = DioService();

  String URI_PREFIX = 'http://192.168.10.160:8080';
  // String URI_PREFIX = 'http://192.168.0.72:8080';

  String token = '';
  List<String> users = [];

  void getError() {
    log("getError");
    throw Exception(["Custom Exception"]);
  }

  void getUsers({required BuildContext buildContext}) async {
    String apiUrl = '$URI_PREFIX/user';
    Response? res;

    try {
      res = await dioService.dio.get(apiUrl);
    } catch (e) {
      print(e);
      print(e.runtimeType);
    }

    print(res);
  }

  Future<void> getAuthCheck({required BuildContext buildContext}) async {
    String apiUrl = '$URI_PREFIX/user/authCheck';
    Response? res;

    try {
      res = await dioService.dio.get(apiUrl);
    } catch (e) {
      print(e);
      print(e.runtimeType);
    }

    print("getAuthCheck :: ${res}");
  }

  Future<String?> getLogin() async{
    String apiUrl = '$URI_PREFIX/user/login';


    Map<String, dynamic> body = {
      "id":"strong1133",
      "password":"tjrwls4555"
    };

    DioDto dioDto =  await dioService.post(path: apiUrl, body: body);
    if(dioDto.isError){
      log("getLogin Error");
      log(dioDto.dioError!.message.toString());
      return null;
    }

    String token = dioDto.getResponse!.data['data']['token'];
    return token;
  }


  void dioLockTest({required BuildContext buildContext})async {
    for(int i =0; i < 2; i++){
      log("Attempt Http Request #$i");
       await getAuthCheck(buildContext: buildContext);
    }
    
  }
}
