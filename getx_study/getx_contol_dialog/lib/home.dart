import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_contol_dialog/dialog_controller.dart';

class Home extends StatelessWidget {
  DialogController dialogController = Get.put(DialogController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: buildBody(context),
    );
  }

  Widget buildBody(
    BuildContext context,
  ) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              const Text('Dialog Sample'),
              SizedBox(
                width: 200,
                child: TextField(
                    onSubmitted: (v) => dialogController.tempText.value = v),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  dialogController.openWarn(context, "경고!");
                },
                child: const Text('Open Warn'),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  dialogController.empWanr(context);
                },
                child: const Text('Open EMP WARN'),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    dialogController.cofirm(
                        context, () => dialogController.processing(context));
                  },
                  child: const Text('Go !!'))
            ],
          ),
        ),
      ),
    );
  }
}
