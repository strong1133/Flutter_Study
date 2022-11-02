import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home2 extends StatelessWidget {
  Home2({super.key});

  final GlobalKey<ScaffoldMessengerState> gk = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BottomSheet Snack bar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("This is a Snack bar"),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.green,
                  ));
                },
                child: const Text("Show Snack bar")),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      enableDrag: false,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: MediaQuery.of(context).size.height, //this height is not contain `Text("Just a title")`'s height.
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                // mainAxisSize: MainAxisSize.min,
                                children: const [
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("Profile"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("Profile"),
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.person),
                                    title: Text("Profile"),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: const Text("Show Bottom Sheet")),
          ],
        ),
      ),
    );
  }
}
