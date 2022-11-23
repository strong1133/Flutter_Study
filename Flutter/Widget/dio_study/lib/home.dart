import 'package:dio_study/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Dio Study'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Home'),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: Text('500')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () {}, child: Text('401')),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    homeProvider.getUsers(buildContext: context);
                  },
                  child: Text('200'))
            ],
          ),
        ));
  }
}
