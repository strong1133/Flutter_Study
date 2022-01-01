import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                            '80',
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
                              '11',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                        Text(
                          '습도 100%',
                          style: TextStyle(fontSize: 15.0),
                        ),
                        Text(
                          '풍속 5.7 m/s',
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
                  padding:
                      EdgeInsets.symmetric(vertical: 13.0, horizontal: 50.0),
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
