// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; // image 패키지 가져오기

class Camera2View extends StatefulWidget {
  final List<CameraDescription> cameras;
  const Camera2View({required this.cameras, super.key});

  @override
  State<Camera2View> createState() => _Camera2ViewState();
}

class _Camera2ViewState extends State<Camera2View> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  Future<void> takePicture() async {
    if (!controller.value.isInitialized) {
      return;
    }

    // 사진 찍기
    final XFile picture = await controller.takePicture();

    // 이미지 크롭
    final originalImage = img.decodeImage(File(picture.path).readAsBytesSync());

    // 원본 이미지의 크기
    final originalWidth = originalImage!.width;
    final originalHeight = originalImage.height;

    // 크롭할 중심 위치 계산
    final centerX = originalWidth ~/ 2;
    final centerY = originalHeight ~/ 2;

    // 크롭할 영역 계산
    final cropLeft =
        centerX - ((MediaQuery.of(context).size.width - 450) ~/ 2); // 좌측 시작 위치
    final cropTop = centerY - (600 ~/ 2); // 상단 시작 위치
    final cropRight = cropLeft + 600; // 가로 크기
    final cropBottom = cropTop + 400; // 세로 크기

    final croppedImage =
        img.copyCrop(originalImage, cropLeft, cropTop, cropRight, cropBottom);

    // 크롭된 이미지를 base64로 변환하고 로그에 출력
    final croppedBase64 = base64Encode(img.encodeJpg(croppedImage));
    print('Cropped Image Base64: $croppedBase64');

    // 사진을 팝업으로 보여주기
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:
              Image.memory(Uint8List.fromList(img.encodeJpg(croppedImage))),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("asd"),
      ),
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Center(
                child: CameraPreview(
              controller,
            )),
            CustomPaint(
              painter: HolePainter(),
              child: Container(
                width: double.infinity, // 화면 가로로 꽉 채우기
                height: double.infinity, // 화면 세로로 꽉 채우기
                child: Center(
                  child: Container(
                    width: 700, // 가로 크기 (픽셀)
                    height: 500, // 세로 크기 (픽셀)
                    color: Colors.transparent, // 구멍 배경 투명
                  ),
                ),
              ),
            ),
            Positioned(top: 140, child: Container(
                              width: MediaQuery.of(context).size.width, // 화면 가로 길이만큼 너비 설정
              child: Center(child: Text('asda', style: TextStyle(color: Colors.white),))),),
            Positioned(
              bottom: 20, // 화면 하단에 위치
              child: Container(
                width: MediaQuery.of(context).size.width, // 화면 가로 길이만큼 너비 설정
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        takePicture();
                      },
                      icon: Icon(
                        Icons.camera,
                        size: 80,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HolePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withOpacity(0.7) // 검은색 배경
      ..style = PaintingStyle.fill;

    final holePaint = Paint()
      ..color = Colors.white // 흰색 테두리 색상
      ..style = PaintingStyle.stroke // 선 스타일
      ..strokeWidth = 2.0; // 선의 굵기

    final holePath = Path.combine(
      PathOperation.difference,
      Path()
        ..addRect(
            Rect.fromPoints(Offset.zero, Offset(size.width, size.height))),
      Path()
        ..addRRect(RRect.fromLTRBR(
          (size.width - 700) / 2, // 가로 위치 조정
          (size.height - 400) / 2, // 세로 위치 조정
          (size.width + 700) / 2, // 가로 위치 조정
          (size.height + 500) / 2, // 세로 위치 조정
          Radius.circular(8), // 테두리의 모서리 반지름
        )),
    );

    canvas.drawPath(holePath, paint);
    canvas.drawPath(holePath, holePaint); // 구멍 테두리 그리기
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
