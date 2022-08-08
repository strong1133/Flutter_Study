import 'package:controller_instance_test/test_controller.dart';
import 'package:controller_instance_test/test_service.dart';
import 'package:get/get.dart';

class DI {
  String genTag() {
    String tag = hashCode.toString();
    return tag;
  }

  late TestController testController;
  late TestService testService;

  DI() {
    String rawServiceTag = genTag() + '_service';
    String rawCtrlTag = genTag() + '_ctrl';

    testController = Get.put(TestController(), tag: rawCtrlTag);
    testService = Get.put(TestService(tag: rawServiceTag, testController: testController), tag: rawServiceTag);
  }

  TestController get getCtrl => testController;
  TestService get getService => testService;
}
