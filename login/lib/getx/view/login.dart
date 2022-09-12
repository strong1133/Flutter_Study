import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login/getx/controller/login_ctrl.dart';
import 'package:login/widgets/inputter.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  LoginCtrl loginCtrl = Get.put(LoginCtrl());

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/login_background.png'))),
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
                Text('Strong Sub',
                    style: GoogleFonts.doHyeon(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Inputter(
                      placeHolder: 'ID',
                      top: true,
                      onChanged: (e) {
                        loginCtrl.id.value = e;
                      },
                    ),
                    Inputter(
                      placeHolder: 'PW',
                      isSecret: true,
                      bottom: true,
                      onChanged: (e) {
                        loginCtrl.pwd.value = e;
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
                          onPressed: () {
                            loginCtrl.loginBtnClick();
                          },
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          '아직 회원이 아니라면?',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            print("Go Register");
                          },
                          child: const Text(
                            '회원가입',
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
