// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:mask_for_camera_view/helpers/view_style.dart';
// import 'package:mask_for_camera_view/inside_line/mask_for_camera_view_inside_line.dart';
// import 'package:mask_for_camera_view/mask_for_camera_view.dart';
// import 'package:mask_for_camera_view/mask_for_camera_view_result.dart';

// class CameraView extends StatefulWidget {
//   final List<CameraDescription> cameras;
//   const CameraView({required this.cameras, super.key});

//   @override
//   State<CameraView> createState() => _CameraViewState();
// }

// class _CameraViewState extends State<CameraView> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('camera'),
//       ),
//       body: MaskForCameraView(
//         visiblePopButton: false,
//         insideLine: MaskForCameraViewInsideLine(
//           position: MaskForCameraViewInsideLinePosition.endPartThree,
//           direction: MaskForCameraViewInsideLineDirection.horizontal,
//         ),
//         boxBorderWidth: 2.6,
//         boxHeight: 1275,
//         boxWidth: 993,
//         // [cameras.first] is rear camera.
//         cameraDescription: widget.cameras.first,
//         onTake: (MaskForCameraViewResult? res) => res != null
//             ? showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 backgroundColor: Colors.transparent,
//                 builder: (context) => Container(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 12.0, horizontal: 14.0),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(26.0),
//                       topRight: Radius.circular(26.0),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text(
//                         "Cropped Images",
//                         style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       const SizedBox(height: 12.0),
//                       res.croppedImage != null
//                           ? MyImageView(imageBytes: res.croppedImage!)
//                           : Container(),
//                       const SizedBox(height: 8.0),
//                       Row(
//                         children: [
//                           res.firstPartImage != null
//                               ? Expanded(
//                                   child: MyImageView(
//                                       imageBytes: res.firstPartImage!))
//                               : Container(),
//                           res.firstPartImage != null &&
//                                   res.secondPartImage != null
//                               ? const SizedBox(width: 8.0)
//                               : Container(),
//                           res.secondPartImage != null
//                               ? Expanded(
//                                   child: MyImageView(
//                                       imageBytes: res.secondPartImage!))
//                               : Container(),
//                         ],
//                       ),
//                       const SizedBox(height: 20.0),
//                       Container(
//                         height: 48.0,
//                         decoration: BoxDecoration(
//                           color: Colors.purple,
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         child: Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             onTap: () {
                             
//                             },
//                             borderRadius: BorderRadius.circular(12.0),
//                             child: const Center(
//                               child: Text(
//                                 "Find plugin on pub.dev",
//                                 style: TextStyle(
//                                   fontSize: 16.0,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             : {},
//       ),
//     );
//   }
// }
// class MyImageView extends StatelessWidget {
//   const MyImageView({Key? key, required this.imageBytes}) : super(key: key);
//   final Uint8List imageBytes;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(4.0),
//       child: SizedBox(
//         width: double.infinity,
//         child: Image.memory(imageBytes),
//       ),
//     );
//   }
// }