import 'package:fatos_flutter_getx_study01/app/views/search_view.dart';
import 'package:flutter/material.dart';

class HomeRootView extends StatelessWidget {
  const HomeRootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("XXX HOME BIULD");
    return Center(
      child: Column(
        children: [
          Text("HOME"),
          SizedBox(
            height: 20,
          ),
          TextField()
        ],
      ),
    );
  }
}
