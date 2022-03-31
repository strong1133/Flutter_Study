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
                  child: const Text('Go !!')),
              SizedBox(
                height: 50,
              ),
              DataTable(columns: [
                DataColumn(label: Text('이름')),
                DataColumn(label: Text('출생년도'), numeric: true),
                DataColumn(label: Text('성별')),
                DataColumn(label: Text('최종학력')),
                DataColumn(label: Text('고향')),
              ], rows: [
                DataRow(cells: [
                  DataCell(Text('철수')),
                  DataCell(Text('1977')),
                  DataCell(Text('남')),
                  DataCell(Text('학사')),
                  DataCell(Text('부산')),
                ])
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
