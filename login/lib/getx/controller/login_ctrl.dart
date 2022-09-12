import 'package:get/get.dart';

class LoginCtrl extends GetxController {
  RxString id = ''.obs;
  RxString pwd = ''.obs;

  void loginBtnClick() {
    print("Login Btn Click ID: ${id.value} / PWD: ${pwd.value}");
  }
}
