import 'package:bloc/counter_bloc.dart';
import 'package:bloc/counter_bloc_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home2 extends StatelessWidget {
  Home2({Key? key}) : super(key: key);
  CounterBlocCtrl counterBlocCtrl = CounterBlocCtrl();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder(
            stream: counterBlocCtrl.stream,
            builder: (context, snapshot) {
            return Text('${snapshot.data}');
          } ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: counterBlocCtrl.stream,
            builder: (context, snapshot) {
            return Text('${snapshot.data}');
          } ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                counterBlocCtrl.increment();
              },
              child: Text('Add')),
          ElevatedButton(onPressed: () {
            counterBlocCtrl.decrement();
          }, child: Text('Sub')),
          ElevatedButton(onPressed: () {
            counterBlocCtrl.reset();
          }, child: Text('Reset')),
        ],
      ),
    );
  }
}
