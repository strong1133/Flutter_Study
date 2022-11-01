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
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          body: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const ListTile(
                                leading: Icon(Icons.person),
                                title: Text("Profile"),
                              ),
                              const ListTile(
                                leading: Icon(Icons.edit),
                                title: Text("Edit"),
                              ),
                              const ListTile(
                                leading: Icon(Icons.exit_to_app),
                                title: Text("Exit"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("This is a Bottom sheet Snack bar"), behavior: SnackBarBehavior.floating,));
                                  },
                                  child: const Text("OK")),
                            ],
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
