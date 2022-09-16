import 'package:actual/common/component/custom_text_form_field.dart';
import 'package:actual/common/const/colors.dart';
import 'package:actual/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: SafeArea(
      top: true,
      bottom: false,
      child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Title(),
              _SubTitle(),
              Image.asset('asset/img/misc/logo.png',
              width: MediaQuery.of(context).size.width/3 *2),
              CustomTextFormField(
                hintText: '이메일을 입력해주세요.',
                onChanged: (String value){},
              ),
              CustomTextFormField(
                hintText: '비밀번호를 입력해주세요.',
                onChanged: (String value){},
                obscureText: true,
              ),
              ElevatedButton(onPressed: (){}, child: Text('로그인'),
              style: ElevatedButton.styleFrom(
                primary: PRIMARY_COLOR
              ),),
              TextButton(onPressed: (){}, child: Text('회원가입'),
              style: TextButton.styleFrom(
                primary: PRIMARY_COLOR
              ),)
            ],
          ),
    ));
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('환영합니다.', style: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w500,
      color: Colors.black
    ),);
    
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('이메일과 비밀번호를 입력해서 로그인 해주세요! \n오늘도 성공적인 주문이 되길.', style: TextStyle(
      fontSize: 16,
      color: BODY_TEXT_COLOR
    ),);
    
  }
}