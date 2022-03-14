import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class ImageController extends GetxController {
  Map fileName = {"name": "", "path": ""}.obs;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      var bf = result.files.first.bytes;
      fileName["path"] = bf.toString();
      fileName["name"] = result.files.first.name;
      // fileName["path"] = result.files.first.bytes as StringBuffer;
      print(fileName);

      print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&tacoCSVFormData  :: ${fileName}");
    }
    update();
  }
}
