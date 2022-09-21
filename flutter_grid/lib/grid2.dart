import 'package:flutter/material.dart';
class Grid2 extends StatelessWidget {
  final List<List<int>> tableData = [
    [9, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [8, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [7, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [6, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [5, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [4, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [3, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [2, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    [0, 2, 3, 4, 5, 6, 7, 8, 9, 10],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        height: 500,
        child: Column(children: [
          Row(children: [
            Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                color: Colors.red,
                child: Text('0')),
            Container(
              width: 400,
              height: 40,
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  //item의 반복문 항목 형성
                  return Container(
                      width: 40.0, // Unit 1개의 width
                      height: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green)),
                      //margin: EdgeInsets.all(0.5),
                      child: Text('$index'));
                },
              ),
            )
          ]),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            //Floors
            Container(
              width: 40.0,
              height: 400.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  //item의 반복문 항목 형성
                  return Container(
                      width: 40.0,
                      height: 40.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber)),
                      //margin: EdgeInsets.all(0.5),
                      //color: Colors.blue,
                      child: Text('$index'));
                },
              ),
            ),
            Container(
                width: 400.0,
                height: 400.0,
//                 decoration:
//                     BoxDecoration(border: Border.all(color: Colors.blue)),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 400.0,
                            height: 400.0,
                            child: Column(
                                children: tableData
                                    .map<Widget>((List<int> l) => Expanded(
                                          child: Row(
                                              children: l
                                                  .map<Widget>((int i) =>
                                                      Expanded(
                                                        child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    //color: Colors.red,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .white)),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                                i.toString(),
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white))),
                                                      ))
                                                  .toList()),
                                        ))
                                    .toList())),
                      ],
                    )))
          ])
        ]));
  }
}