import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:widget_focus/focus_util.dart';
import 'package:widget_focus/home_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
          homeProvider.getFocus(target: '19');
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [ElevatedButton(onPressed: () {}, child: Text('Focus!!')), ...genWidget(homeProvider)],
        ),
      ),
    );
  }

  List<Widget> genWidget(HomeProvider homeProvider) {
    List<Widget> widgetList = [];
    for (String str in homeProvider.textList) {
      homeProvider.globalKeyMap[str] = GlobalKey();

      Widget listBody = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: 200,
            height: 50,
            color: Colors.grey,
            key: homeProvider.globalKeyMap[str],
            child: Center(
              child: Text(str),
            )),
      );
      widgetList.add(listBody);
    }
    return widgetList;
  }
}
