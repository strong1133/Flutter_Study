import 'package:get/get.dart';

class TestController extends GetxController {
  int num = 0;


  get getNum => num;


  void add(int _) {
    num += _;
  }

 
}
