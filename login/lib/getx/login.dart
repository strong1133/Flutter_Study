import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login/widgets/inputter.dart';

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
                Column(
                  children: [
                    Inputter(
                      top: true,
                      onChanged: (e){
                      print("TOP ${e}");
                    },),
                    Inputter(
                      bottom: true,
                      onChanged: (e){
                      print("Bottom ${e}");
                    },)
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
