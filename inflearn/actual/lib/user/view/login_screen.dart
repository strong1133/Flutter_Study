import 'dart:io';

import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dio = Dio();

    final EmulatorIp = '10.0.2.2:3000';
    final SimulatorIp = '127.0.0.1:3000';

    final ip = Platform.isIOS ? SimulatorIp : EmulatorIp;

    return DefaultLayout(
        child: SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _Title(),
              const SizedBox(
                height: 16.0,
              ),
              _SubTitle(),
              Image.asset('asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2),
              CustomTextFormField(
                hintText: '이메일을 입력해주세요.',
                onChanged: (String value) {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: '비밀번호를 입력해주세요.',
                onChanged: (String value) {},
                obscureText: true,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  final res = await dio.post('http://$ip/auth/login');
                },
                child: Text('로그인'),
                style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
              ),
              TextButton(
                onPressed: () {},
                child: Text('회원가입'),
                style: TextButton.styleFrom(primary: PRIMARY_COLOR),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '환영합니다.',
      style: TextStyle(
          fontSize: 34, fontWeight: FontWeight.w500, color: Colors.black),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '이메일과 비밀번호를 입력해서 로그인 해주세요! \n오늘도 성공적인 주문이 되길.',
      style: TextStyle(fontSize: 16, color: BODY_TEXT_COLOR),
    );
  }
}
