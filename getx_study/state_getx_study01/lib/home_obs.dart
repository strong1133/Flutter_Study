import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_getx_study01/controller/counterController.dart';

import 'widgets/fatos_calendar.dart';

class Home_obs extends StatefulWidget {
  @override
  State<Home_obs> createState() => _Home_obsState();
}

class _Home_obsState extends State<Home_obs> {
  CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Study'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Text('Hello World'),
              SizedBox(
                height: 10.0,
              ),
              Obx(() => Text('${controller.count}')),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text("Increase"),
              ),
              Divider(
                thickness: 2.0,
                height: 2.0,
                color: Colors.black,
              ),
              Container(
                child: const FatosCalender(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
