import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  int count = 0;
  void increment() {
    count++;
    update();
  }
}
