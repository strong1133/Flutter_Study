import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('images/login_background.png'))),
        child: Center(
          child: Container(
            width: 500,
            height: 400,
            // decoration: BoxDecoration(
            //   border: Border.all(width: 1.0, color: Colors.white),
            //   borderRadius: BorderRadius.circular(15),
            // ),
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.black38),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1, color: Colors.black38),
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
                            ),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
