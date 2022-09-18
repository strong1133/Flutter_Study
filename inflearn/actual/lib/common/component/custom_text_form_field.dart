import 'package:actual/common/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool autofocus;
  final ValueChanged<String> onChanged;
  const CustomTextFormField({
    required this.onChanged,
    this.obscureText =false,
    this.autofocus =false,
    this.hintText,
    this.errorText,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final baseBorder =  OutlineInputBorder(
      borderSide:  BorderSide(
        color: INPUT_BORDER_COLOR,
        width: 1.0
      )
    );

    return TextFormField(
      cursorColor: PRIMARY_COLOR,
      obscureText: obscureText,
      autofocus: autofocus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        hintText:hintText,
        hintStyle: const TextStyle(
          color: BODY_TEXT_COLOR,
          fontSize: 14.0
        ),
        errorText: errorText, 
        fillColor: INPUT_BG_COLOR,
        filled: true,

        border: baseBorder, // 기본 상태 보더
        focusedBorder: baseBorder.copyWith(
          borderSide: baseBorder.borderSide.copyWith(color: PRIMARY_COLOR) 
        ), // 선택 되었을 때 보더
        enabledBorder: baseBorder
      ),
    );
  }
}