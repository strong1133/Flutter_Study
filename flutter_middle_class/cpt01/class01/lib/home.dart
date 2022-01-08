import 'package:class01/model/AirResult.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AirResult _airResult = AirResult();

  Future<AirResult> fetchData() async {
    var base = "api.airvisual.com";
    var param = {'key': '7a2e226e-a693-4923-97e5-45de42255e53'};

    final uri = Uri.https(base, '/v2/nearest_city', param);
    var res = await http.get(uri);
    // print(res.body);
    AirResult airResult = AirResult.fromJson(json.decode(res.body));
    return airResult;
  }

  @override
  void initState() {
    super.initState();

    fetchData().then((airResult) {
      setState(() {
        _airResult = airResult;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _airResult == null
          ? CircularProgressIndicator()
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '현재 위치 미세먼지',
                      style: TextStyle(fontSize: 30.0),
                    ),
                    Card(
                      shadowColor: Colors.grey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text('얼굴사진'),
                                Text(
                                  '${_airResult.data?.current?.pollution?.aqius}',
                                  style: TextStyle(fontSize: 40.0),
                                ),
                                Text(
                                  '보통',
                                  style: TextStyle(fontSize: 20.0),
                                )
                              ],
                            ),
                            color: Colors.yellow,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text('이미지'),
                                  SizedBox(
                                    width: 16.0,
                                  ),
                                  Text(
                                    '${_airResult.data?.current?.weather?.tp}',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                              Text(
                                '습도 ${_airResult.data?.current?.weather?.hu}%',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              Text(
                                '풍속 ${_airResult.data?.current?.weather?.ws} m/s',
                                style: TextStyle(fontSize: 15.0),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: RaisedButton(
                        onPressed: () {},
                        elevation: 0,
                        padding: EdgeInsets.symmetric(
                            vertical: 13.0, horizontal: 50.0),
                        color: Colors.orange,
                        child: Icon(
                          Icons.refresh,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
