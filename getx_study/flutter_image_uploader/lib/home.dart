import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_uploader/image_contoller.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ImageController imageController = Get.put(ImageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    imageController.convertAssetToByteData();
  }

  @override
  Widget build(BuildContext context) {
    print(imageController.fileName['path']);
    return Scaffold(
      appBar: AppBar(title: Text('Image Upload')),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          Text("asdads"),
          _uploadBox(context),
          SizedBox(
            height: 50,
          ),
          TextButton(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.transparent)),
              onPressed: () {
                imageController.pickFile();
              },
              child: Obx(
                () => Image.memory(
                  imageController.byteData,
                  width: 200,
                  height: 300,
                ),
              ))
        ],
      ),
    );
  }

  Widget _uploadBox(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
              flex: 35,
              child: OutlinedButton(
                onPressed: () {
                  imageController.pickFile();
                },
                // onPressed: () async {
                //   var picked = await FilePicker.platform.pickFiles();
                //   if (picked != null) {
                //     print(picked);
                //     print(picked.files.first.name);
                //   }
                // },
                //onPressed: () => print("Clicked choose file"),
                child: const Text(
                  "Choose File",
                  style: TextStyle(color: Colors.black, fontSize: 12),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Flexible(
            //   flex: 35,
            //   child: Obx(
            //       () => Text("${controller.fileName["tacoCSV"] ?? "no file"}")),
            //   // child: Obx(() => TextFormField(
            //   //       readOnly: true,
            //   //       decoration: InputDecoration(
            //   //         hintStyle: const TextStyle(fontSize: 12),
            //   //         hintText: controller.fileName[value != ''
            //   //             ? controller.fileName.value
            //   //             : "no file",
            //   //         border: const OutlineInputBorder(),
            //   //       ),
            //   //     )),
            // ),
            const SizedBox(width: 10),
            Flexible(
              flex: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange),
                //CSV 파일 업로드
                onPressed: () {},
                //onPressed: () => AltDialog().alertSuccess(context),
                child: const Text(
                  "Upload",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
