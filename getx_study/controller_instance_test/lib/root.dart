import 'package:controller_instance_test/di.dart';
import 'package:controller_instance_test/test_controller.dart';
import 'package:controller_instance_test/test_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
  Root({Key? key}) : super(key: key);

  TestController testController1 = Get.put(TestController(), tag: 'testController1');
  TestController testController2 = Get.put(TestController(), tag: 'testController2');

  TestService testService1 = Get.put(TestService(tag: 's1', testController: Get.put(TestController(), tag: 'testController1')), tag: 's1');
  TestService testService2 = Get.put(TestService(tag: 's2', testController: Get.put(TestController(), tag: 'testController2')), tag: 's2');

  TestController testController3 = DI().getCtrl;
  TestService testService3 = DI().getService;

  DI di = DI();
  DI di2 = DI();

  @override
  Widget build(BuildContext context) {
    TestController testController4 = di.getCtrl;
    TestService testService4 = di.getService;

    TestController testController5 = di2.getCtrl;
    TestService testService5 = di2.getService;
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Instance Test'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('home'),
              ElevatedButton(
                  onPressed: () {
                    print("testController1  :: ${testController1.hashCode}");
                    print("testController2  :: ${testController2.hashCode}");

                    testController1.add(3);
                    testController2.add(4);
                    print("testController1  :: ${testController1.getNum}");
                    print("testController2  :: ${testController2.getNum}");

                    testService1.getCtrlInstance();
                    testService2.getCtrlInstance();
                  },
                  child: Text('Check')),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    print("testService1  :: ${testService1.hashCode}");
                    print("testService2  :: ${testService2.hashCode}");

                    print("testService1  :: ${testService1.getService.hashCode}");
                    print("testService2  :: ${testService2.getServiceInstance}");
                  },
                  child: Text('Check 2')),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    print("3  :: ${testController3.hashCode}");
                    print("3  :: ${testService3.testController.hashCode}");

                    print("4  :: ${testController4.hashCode}");
                    print("4  :: ${testService4.testController.hashCode}");

                    testController4.add(15);
                    testService5.testController.add(30);
                    print("4  :: ${testController4.getNum}");
                    print("4  :: ${testService4.testController.getNum}");

                    print("5  :: ${testController5.getNum}");
                    print("5  :: ${testService5.testController.getNum}");
                  },
                  child: Text('Check 3'))
            ],
          ),
        ),
      ),
    );
  }
}
