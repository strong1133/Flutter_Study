import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_getx/counter_provider.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (context) => CounterProvider(),
      child: Center(
        child: Column(
          children: [
            Text('0'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print('add');
                  CounterProvider().add();
                },
                child: Text('Add'))
          ],
        ),
      ),
    );
  }
}
