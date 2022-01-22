import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:state_getx_study01/controller/counterController.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
      child: Container(
        child: Column(
          children: <Widget>[
            Text('Hello World'),
            SizedBox(
              height: 10.0,
            ),
            GetBuilder<CounterController>(builder: (controller) {
              return Text('${controller.count}');
            }),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
              onPressed: () {
                controller.increment();
              },
              child: Text("Increase"),
            ),
          ],
        ),
      ),
    );
  }
}
