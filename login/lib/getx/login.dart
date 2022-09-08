import 'package:flutter/material.dart';
import 'package:login/widgets/inputter.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('images/login_background.png'))),
        child: Center(
          child: SizedBox(
            width: 400,
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
                      placeHolder: 'ID',
                      top: true,
                      onChanged: (e) {
                        print("TOP ${e}");
                      },
                    ),
                    Inputter(
                      placeHolder: 'PW',
                      isSecret: true,
                      bottom: true,
                      onChanged: (e) {
                        print("Bottom ${e}");
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 35,
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.green[400];
                              } else {
                                return Colors.green;
                              }
                            }),
                          ),
                          onPressed: () {},
                          child: const Text(
                            '로그인',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 35,
                      width: double.maxFinite,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.pressed)) {
                                return Colors.yellow[200];
                              } else {
                                return Colors.yellow;
                              }
                            }),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/kakao_icon.png'),
                              const Text(
                                ' 카카오톡으로 로그인',
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
                              )
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
