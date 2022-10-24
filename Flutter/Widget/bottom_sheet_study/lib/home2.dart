import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home2'),),
      body: Center(
        child: Column(
          children: [
    
            Text('HOME2'),
            ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (context) {
                return bs();
              });
            }, child: Text('Btn'))
          ],
        ),
      ),
    );
  }

  Widget bs (){
    return Container(
      height: 300.0,
      child: Center(
        child:  Column(
          children: [
            Text('Bottom Sheet'),
            ElevatedButton(onPressed: (){}, child: Text('Home2'))
          ],
        ),
      )
    );
  }
}