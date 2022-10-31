import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class Home extends StatelessWidget {
   Home({super.key});

  final ImagePicker _imagePicker = ImagePicker();
  List<XFile> _pickedList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text('asd'), ElevatedButton(onPressed: () {
        _pickImg();
      }, child: Text('Go'))],
    );
  }

  Future<void> _pickImg() async{
    final List<Asset> images = await MultiImagePicker.pickImages(maxImages: 5);

    log(images.toString());
  }
}
