import 'package:controller_instance_test/test_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Root extends StatelessWidget {
   Root({Key? key}) : super(key: key);


  TestController testController1 = Get.put(TestController(), tag: 'testController1');
  TestController testController2 = Get.put(TestController(), tag: 'testController2');

  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Instance Test'),),
          body: Center(
            child:  Column(
              children: [
                Text('home'),

                ElevatedButton(onPressed: (){
                  print("testController1  :: ${testController1.hashCode}");
                  print("testController2  :: ${testController2.hashCode}");

                  testController1.add(3);
                  testController2.add(4);
                  print("testController1  :: ${testController1.getNum}");
                  print("testController2  :: ${testController2.getNum}");

                  
                }, child: Text('Check'))
              ],
            ),
          ),
        ),
      );
  }
}