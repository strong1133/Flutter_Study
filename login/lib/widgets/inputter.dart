import 'package:flutter/material.dart';

class Inputter extends StatelessWidget {
  Function onChanged;
  bool? top;
  bool? bottom;
  Inputter({required this.onChanged, this.top = false, this.bottom=false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius =  const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0));
    if(top == true){
      borderRadius = const BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0));
    }else if(bottom == true){
      borderRadius = const BorderRadius.only(bottomLeft: Radius.circular(8.0), bottomRight: Radius.circular(8.0));
    }
    return TextField(
      onChanged: (e){
        onChanged(e);
      },
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black38),
            borderRadius: borderRadius
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.black38),
            borderRadius: borderRadius
          ),
          filled: true,
          fillColor: Colors.white),
    );
  }
}
