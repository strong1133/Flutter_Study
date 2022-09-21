import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Grid3Fc extends StatelessWidget {
  double width;
  double height;

  Grid3Fc({this.width = 200, this.height = 200, Key? key}) : super(key: key);

  final List<List<int>> tableData = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 1, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 2, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 2, 0, 0, 0, 1, 0, 0, 0, 0],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Column(
            children: tableData
                .map<Widget>((List<int> l) => Expanded(
                      child: Row(
                          children: l.map<Widget>((int i) {
                        Color color = Colors.grey;

                        var lIdx = tableData.indexOf(l);
                        var iIdx = l.indexOf(i);

                        switch (i) {
                          case 1:
                            color = Colors.green;
                            break;
                          case 2:
                            color = Colors.red;
                            break;
                        }

                        return Expanded(
                          child: InkWell(
                            onTap: () {
                              print("Cell CLick ::");
                              print("IDX: floor => ${lIdx+1}  room => ${iIdx+1}");
                              print("VALUE: ${tableData[lIdx][iIdx]}");
                            },
                            child: Container(
                                decoration: BoxDecoration(color: color, border: Border.all(color: Colors.black)),
                                alignment: Alignment.center,
                                child: Text(i.toString(), style: TextStyle(color: Colors.black))),
                          ),
                        );
                      }).toList()),
                    ))
                .toList()));
  }
}
