import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Instagram Clone',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Instagram에 오신 것을 환영합니다.',
                  style: TextStyle(fontSize: 24.0),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Text('사진과 동영상을 보려면 팔로우하세요.'),
                Padding(padding: EdgeInsets.all(8.0)),
                SizedBox(
                  width: 260.0,
                  child: Card(
                    elevation: 4.0, // 그림자
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(8.0)),
                        SizedBox(
                          width: 80.0,
                          height: 80.0,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(widget.user.photoUrl),
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                        Text(
                          widget.user.email,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(8.0)),
                        Text(
                          widget.user.displayName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(4.0)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/02/05/17/40/saint-peters-basilica-2040718__480.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2020/11/01/10/35/street-5703332__340.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1.0)),
                            SizedBox(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                'https://cdn.pixabay.com/photo/2021/10/23/03/35/mountain-6734031__480.jpg',
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
                          child: Text('팔로우'),
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        Padding(padding: EdgeInsets.all(5.0)),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
