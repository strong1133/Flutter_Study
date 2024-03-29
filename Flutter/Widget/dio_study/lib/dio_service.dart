import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio_study/dio_dto.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioService {
  Dio dio = Dio();

  DioService() {
    dio.interceptors.addAll([
      // DioLogInterceptor(dio: dio), 
      QueuedInterceptor(dio: dio)]);
  }

  Future<DioDto> post({required String path, required Map<String, dynamic> body}) async {
    DioDto dioDto = DioDto();
    try {
      Response response = await dio.post(path, data: body);
      dioDto.setResponse = response;
      dioDto.setIsError = false;
      return dioDto;
    } catch (e) {
      DioError dioError = e as DioError;
      dioDto.setDioError = dioError;
      dioDto.setIsError = true;
      return dioDto;
    }
  }
}

class DioLogInterceptor extends Interceptor {
  Dio dio;
  DioLogInterceptor({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }

}

class QueuedInterceptor extends QueuedInterceptorsWrapper {
  Dio dio;
  QueuedInterceptor({required this.dio});
  String Jwt =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOiI2MzdjZGQ3YTY2OWYzY2QzMzE4MzUzNmEiLCJpZCI6InN0cm9uZzExMzMiLCJuYW1lIjoi7KCV7ISd7KeEIiwiaWF0IjoxNjY5MjQ3MzMxfQ.NGV_B12PqGI7HI1_ZaHEsd';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("<<<<<<<< 요청 시직 >>>>>>>>");
    if (options.headers.isEmpty) {
      options.headers.addAll({'Authorization': Jwt});
    }
    print("HEADER ${options.headers}");

    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async{
    log("ERROR!!");
    
    // TODO: implement onError
    if(err.response!.statusCode == 403){
      
      log("토큰 오류!!!");
      // String token = await getLogin();
      String newToken =  await getToken(dio);
      err.requestOptions.headers.clear();
      err.requestOptions.headers.addAll({'Authorization':newToken });
      Jwt = newToken;

      // 실패한 요청 다시 보내는 부분 필요!!
      
      log("토큰 갱신 완료");
    }
      handler.next(err);
    // Fluttertoast.showToast(msg: '${err.response!.data['errMsg']}');
    // super.onError(err, handler);
  }
}

Future<String> getToken (Dio dio) async{
  // Completer completer = Completer();
  log("토큰 갱신 요청");
  String Jwt =  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOiI2MzdjZGQ3YTY2OWYzY2QzMzE4MzUzNmEiLCJpZCI6InN0cm9uZzExMzMiLCJuYW1lIjoi7KCV7ISd7KeEIiwiaWF0IjoxNjY5MjQ3MzMxfQ.NGV_B12PqGI7HI1_ZaHEsd_VVpt_QDFXanhtk-C9QxU";
  // dio.options.headers.remove("Authorization");
  // dio.options.headers.addAll({'Authorization': Jwt});
  // completer.complete();
  return Jwt;
}

// class DioInterceptor extends InterceptorsWrapper {
//   Dio dio;
//   DioInterceptor({required this.dio});

//   String Jwt = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOiI2MzdjZGQ3YTY2OWYzY2QzMzE4MzUzNmEiLCJpZCI6InN0cm9uZzExMzMiLCJuYW1lIjoi7KCV7ISd7KeEIiwiaWF0IjoxNjY5MjQ3MzMxfQ.NGV_B12PqGI7HI1_ZaHEsd';

//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler)async {
//     // TODO: implement onError
//     super.onError(err, handler);
//     if(err.response!.statusCode == 403){
//       log("토큰 오류!!!");
//       dio.lock()
//       // String token = await getLogin();
//       Jwt = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOiI2MzdjZGQ3YTY2OWYzY2QzMzE4MzUzNmEiLCJpZCI6InN0cm9uZzExMzMiLCJuYW1lIjoi7KCV7ISd7KeEIiwiaWF0IjoxNjY5MjQ3MzMxfQ.NGV_B12PqGI7HI1_ZaHEsd_VVpt_QDFXanhtk-C9QxU";

//       log("토큰 갱신!!! ${Jwt}");
//       dio.unlock();
      
//     }
//     Fluttertoast.showToast(msg: '${err.response!.data['errMsg']}');
//   }

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     if (options.headers.isEmpty) {
//       options.headers.addAll({
//         'Authorization':
//             Jwt
//       });
//     }
//     print("HEADER ${options.headers}");

//     // TODO: implement onRequest
//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     // TODO: implement onResponse
//     super.onResponse(response, handler);

//     print(response);
//   }
  
//    Future<String> getLogin() async{
//     String apiUrl = 'http://192.168.10.160:8080/user/login';


//     Map<String, dynamic> body = {
//       "id":"strong1133",
//       "password":"tjrwls4555"
//     };

//     Response response =  await dio.post(apiUrl, data: body);
 
//     String token = response.data['data']['token'];
//     return token;
//   }


// }
