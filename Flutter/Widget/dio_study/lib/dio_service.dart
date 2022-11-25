import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioService {
  Dio dio = Dio();

  DioService() {
    dio.interceptors.addAll([DioLogInterceptor(dio: dio), DioInterceptor(dio: dio)]);
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

class DioInterceptor extends InterceptorsWrapper {
  Dio dio;
  DioInterceptor({required this.dio});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);

    Fluttertoast.showToast(msg: '${err.response!.data['errMsg']}');
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.headers.isEmpty) {
      options.headers.addAll({
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHgiOiI2MzdjZGQ3YTY2OWYzY2QzMzE4MzUzNmEiLCJpZCI6InN0cm9uZzExMzMiLCJuYW1lIjoi7KCV7ISd7KeEIiwiaWF0IjoxNjY5MjQ3MzMxfQ.NGV_B12PqGI7HI1_ZaHEsd_VVpt_QDFXanhtk-C9Qx'
      });
    }
    print("HEADER ${options.headers}");

    // TODO: implement onRequest
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);

    print(response);
  }
}
