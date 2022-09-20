import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
         SizedBox(
            width: 50,
            height: 500,
            child: GridView.count(
              crossAxisCount: 1,
              children: List.generate(3, (index) {
                return Container(
                  decoration: BoxDecoration(border: Border.all(), color: Colors.red),
                  child: Text('idx $index'),
                );
              }),
            ),
          ),
          SizedBox(
            width: 250,
            height: 500,
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(12, (index) {
                return Container(
                  decoration: BoxDecoration(border: Border.all(), color: Colors.red),
                  child: Text('idx $index'),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
