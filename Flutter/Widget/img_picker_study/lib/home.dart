import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_picker/images_picker.dart';

class Home extends StatefulWidget {
  Home();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PickedFile _image;
  List<Media> _images = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 100,
            height: 100,
            child: Center(
              child: _image == null ? Text('No Image') : Image.file(File(_image.path)),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ..._images.map(
                  (e) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: Center(
                        child: Image.file(File(e.path)),
                      ),
                    );
                  },
                ).toList()
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       getImageFromCamera();
          //       log('CAMERA');
          //     },
          //     child: Text('Camera')),
          // ElevatedButton(
          //     onPressed: () {
          //       getImageFromGallery();
          //     },
          //     child: Text('Gallery')),
          ElevatedButton(
              onPressed: () {
                getImageFromGallery();
              },
              child: Text('Gallery Multi'))
        ],
      ),
    );
  }

  // Future getImageFromCamera() async {
  //   var image = await ImagePicker.platform.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  // Future getImageFromGallery() async {
  //   var image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = image;
  //   });
  // }

  // Future getImagesFromGallery() async {
  //   _images.clear();
  //   final List<PickedFile> selectedImages = await ImagePicker.platform.pickMultiImage();
  //   setState(() {
  //     _images.addAll(selectedImages);
  //   });
  // }
  
  Future getImageFromGallery() async {
    List<Media> tempImages = await ImagesPicker.pick(
      count: 5,
      pickType: PickType.image
    );
    setState(() {
    _images.addAll(tempImages);
    });
  }
}
