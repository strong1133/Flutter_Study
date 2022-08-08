import 'package:get/get.dart';

class TestController extends GetxService{

  int num= 0;

  get getNum => num;

  void add(int _){
    num += _;
  }

  
}