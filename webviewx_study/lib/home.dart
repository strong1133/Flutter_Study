
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:webviewx_study/wx.dart';
import 'package:webviewx_study/wx_ctrl.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  WxCtrl wxCtrl = Get.put(WxCtrl());



  @override
  Widget build(BuildContext context) {

    String platform = "";
    if (kIsWeb) {
      platform = 'web';
    }else{
      platform = Platform.localHostname.toString();
    }

   
    return Column(
      children: [
        Text("Platform: ${platform}"),
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        ElevatedButton(
            onPressed: () {
              showDatePicker(
                  builder: (context, child) {
                    return PointerInterceptor(child: child!);
                  },
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                  lastDate: DateTime.now().add(Duration(days: 1000)));
            },
            child: Text('Date')),
        WX(
          callback: (c) {
            wxCtrl.setCtrl(c);
          },
        ),
        Stack(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      print('BTN CLICK 1');
                      wxCtrl.dartCallJs();
                    },
                    child: Text('Test Btn1')),
                PointerInterceptor(
                    child: ElevatedButton(
                        onPressed: () {
                          print('BTN CLICK 2');
                        },
                        child: Text('Test Btn2'))),
              ],
            ),
          ],
        )
      ],
    );
  }
}
