import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:multi_image_picker2/multi_image_picker2.dart';

class Home extends StatelessWidget {
   Home();


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
