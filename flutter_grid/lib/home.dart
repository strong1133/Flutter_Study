import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 330,
            child: Table(
               columnWidths: const {
              0: FractionColumnWidth(.1),
            },
              children: [
                TableRow(children: [
                  Container(
                    height: 30,
                    color: Colors.red,
                    child: const Text("6"),
                  ),
                  Container(
                    height: 30,
                    color: Colors.grey,
                    child: const Text("6"),
                  ),
                ]),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 30.0,
                child: Table(
                  children: [
                    TableRow(children: [
                      Container(
                        color: Colors.cyan,
                        width: 50.0,
                        height: 100.0,
                        child: const Text("6"),
                      ),
                    ]),
                  ],
                ),
              ),
              Container(
                width: 300,
                child: Table(
                  children: [
                    TableRow(children: [
                      Container(
                        color: Colors.green,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("1"),
                      ),
                      Container(
                        color: Colors.red,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("2"),
                      ),
                      Container(
                        color: Colors.amberAccent,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("3"),
                      ),
                      Container(
                        color: Colors.black87,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("4"),
                      ),
                    ]),
                    TableRow(children: [
                      Container(
                        color: Colors.amber,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("5"),
                      ),
                      Container(
                        color: Colors.blue,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("6"),
                      ),
                      Container(
                        color: Colors.purple,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("7"),
                      ),
                      Container(
                        color: Colors.blueGrey,
                        width: 50.0,
                        height: 50.0,
                        child: const Text("8"),
                      ),
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
