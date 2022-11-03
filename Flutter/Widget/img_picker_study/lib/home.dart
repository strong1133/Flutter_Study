
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  Home();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PickedFile _image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [

          SizedBox(height: 30,),

          Container(
            width: 100,
            height: 100,
            child: Center(
              child: _image == null? Text('No Image'):
              Image.file(File(_image.path)),
            ),
          ),
          SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                getImageFromCamera();
              },
              child: Text('Camera')),
          ElevatedButton(onPressed: () {}, child: Text('Gallery'))
        ],
      ),
    );
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
  Future getImageFromGallery() async {
    var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }
}
