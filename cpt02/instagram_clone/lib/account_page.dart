import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            _googleSignIn.signOut();
          },
          icon: Icon(Icons.exit_to_app),
          color: Colors.black,
        )
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2Fca143133-349a-4075-a68b-60ee33b318c9%2FSJ_Main.png?table=block&id=fa0eb946-388d-40b5-9295-9e29d1eca65f&spaceId=89c8c53a-d004-445f-8b96-e4a9cd8ffa7c&width=250&userId=582806da-b4e3-4c8c-8573-a1b75f56bbb5&cache=v2'),
                    ),
                  ),
                  Container(
                    width: 82.0,
                    height: 82.0,
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 29.0,
                      height: 29.0,
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      width: 25.0,
                      height: 25.0,
                      child: FloatingActionButton(
                        onPressed: null,
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(6.0)),
              Text('이름', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text(
            '0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Padding(padding: EdgeInsets.all(2.0)),
        ],
      ),
    );
  }
}
