import 'package:dio/dio.dart';

class DioDto {
  Response? response;
  DioError? dioError;
  bool isError = true;

  DioDto();

  Response? get getResponse => this.response;
  DioError? get getDioError => this.dioError;
  bool get getIsError => this.isError;

  set setResponse(Response? response) => this.response = response;
  set setDioError(DioError? dioError) => this.dioError = dioError;
  set setIsError(bool isError) => this.isError = isError;
}
