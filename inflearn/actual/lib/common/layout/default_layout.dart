import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;

  const DefaultLayout(
      {required this.child,
      this.bottomNavigationBar,
      this.title,
      this.backgroundColor = Colors.white,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: child,
      appBar: renderAppbar(),
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppbar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        automaticallyImplyLeading:false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(title!,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500
        ),),
        foregroundColor: Colors.black,
      
      );
    }
  }
}
