import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class CounterController extends GetxController {
  // GetBuilder
  // int count = 0;
  // void increment() {
  //   count++;
  //   update();
  // }

  //Obx
  RxInt count = 0.obs;
  void increment() {
    count++;
    update();
  }
}
