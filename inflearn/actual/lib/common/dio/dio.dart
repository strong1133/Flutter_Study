import 'package:actual/common/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({required this.storage});

  // 1) 요청을 보낼때
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storage.read(key: ACCESS_TOKEN_KEY);
    options.headers.addAll(
      {
        "authorization": "Bearer $token",
      },
    );

    print("[REQ] :: [${options.method}] ${options.uri}");
    super.onRequest(options, handler);
  }

  // 2) 응답을 받을떄
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  // 3) 에러가 났을때
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    print("[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}]");

    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    // refreshToken 마저도 없으면
    if (refreshToken == null) {
      return handler.reject(err);
    }

    final is401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/auth/token';

    if (is401 && !isPathRefresh) {
      final dio = Dio();

      try {
        final resp = await dio.post('http://$ip/auth/token',
            options: Options(
              headers: {
                "authorization": "Bearer $refreshToken",
              },
            ));

        final accessToken = resp.data['accessToken'];

        final options = err.requestOptions;
        options.headers.addAll({
          'authorization': "Bearer $accessToken",
        });

        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        // 요청 재전송
        final response = await dio.fetch(options);
        return handler.resolve(response);
      } on DioError catch (e) {
        return handler.reject(e);
      }
    }
  }
}
