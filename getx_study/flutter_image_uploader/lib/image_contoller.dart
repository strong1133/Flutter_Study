import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class ImageController extends GetxController {
  Map fileName = {"name": "", "path": ""}.obs;
  var byteData;

  // List stuff = image.toByteData().buffer.asUInt8List()

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      var bf = result.files.first.bytes;

      fileName["name"] = result.files.first.name;
      // fileName["path"] = result.files.first.bytes as StringBuffer;
      print(fileName);
      byteData = bf;

      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&tacoCSVFormData  :: ${fileName}");
    }
    update();
  }

  Future<void> convertAssetToByteData() async {
    byteData = (await rootBundle.load('assets/images/prof_sam.jpeg'))
        .buffer
        .asUint8List();
    // 2번
  }
}
