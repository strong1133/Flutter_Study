import 'dart:convert';
import 'dart:io';

import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:actual/common/view/root_tab.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userName = '';
  String password = '';

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
                onChanged: (String value) {
                  userName = value;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              CustomTextFormField(
                hintText: '비밀번호를 입력해주세요.',
                onChanged: (String value) {
                  password = value;
                },
                obscureText: true,
              ),
              const SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  final rawString = 'test@codefactory.ai:testtest';
                  // final rawString = '$userName:$password';
                  Codec<String, String> stringToBase64 = utf8.fuse(base64);

                  String token = stringToBase64.encode(rawString);

                  final res = await dio.post('http://$ip/auth/login',
                      options: Options(
                        headers: {'Authorization': 'Basic $token'},
                      ));

                  print(res.data);

                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => RootTab()),
                  );
                },
                child: Text('로그인'),
                style: ElevatedButton.styleFrom(primary: PRIMARY_COLOR),
              ),
              TextButton(
                onPressed: () async {
                  final refreshToken =
                      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY2NDQ0NDk5NiwiZXhwIjoxNjY0NTMxMzk2fQ.KcAKPg1yUojaeUe-gpyP95tiW_9Nu_zo64doryQsHqE';
                  final res = await dio.post('http://$ip/auth/token',
                      options: Options(
                        headers: {'Authorization': 'Bearer $refreshToken'},
                      ));

                  print(res.data);
                },
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
