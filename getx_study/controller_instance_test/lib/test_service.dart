import 'package:controller_instance_test/test_controller.dart';
import 'package:get/get.dart';

class TestService extends GetxService {
  String tag;
  late TestController testController;
  TestService({required this.tag, required this.testController});

  TestService get getService => Get.find(tag: tag);

  void getServiceInstance() {
    print(getService.hashCode);
  }
  getCtrlInstance(){
    print(testController.getNum);
    print(testController.hashCode);
  }
}
