import 'package:bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  CounterBloc _counterBloc = new CounterBloc(count: 0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder(
            stream: _counterBloc.stream,
            builder: (context, snapshot) {
            return Text('${snapshot.data}');
          } ),
          SizedBox(
            height: 20,
          ),
          StreamBuilder(
            stream: _counterBloc.stream,
            builder: (context, snapshot) {
            return Text('${snapshot.data}');
          } ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                _counterBloc.increment();
              },
              child: Text('Add')),
          ElevatedButton(onPressed: () {
            _counterBloc.decrement();
          }, child: Text('Sub')),
          ElevatedButton(onPressed: () {
            _counterBloc.reset();
          }, child: Text('Reset')),
        ],
      ),
    );
  }
}
