import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram clone',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(5.0)),
            Text(
              'Instagram에 오신 것을 환영합니다.',
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Text('사진과 동영상을 보려면 팔로우하세요.'),
            Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              width: 260.0,
              child: Card(
                elevation: 4.0,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(8.0)),
                    SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/73330957?v=4'),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text(
                      'strong3879@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    Text(
                      '정석진',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.all(6.0)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2021/11/25/09/27/building-6822998__480.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1.0)),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2021/11/20/05/15/car-6810885__480.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1.0)),
                        SizedBox(
                          width: 70.0,
                          height: 70.0,
                          child: Image.network(
                            'https://cdn.pixabay.com/photo/2021/09/25/08/18/fields-6654366__480.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(1.0)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    Text('FaceBook 친구'),
                    Padding(padding: EdgeInsets.all(5.0)),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('팔로우'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
