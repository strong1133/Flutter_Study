import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(
          'Sign in',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ButtonTheme(
            height: 50.0,
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('images/glogo.png'),
                  Text(
                    'Login with Google',
                    style: TextStyle(color: Colors.black87, fontSize: 15),
                  ),
                  Opacity(opacity: 0.0, child: Image.asset('images/glogo.png'))
                ],
              ),
              color: Colors.white,
              onPressed: () {},
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            height: 50.0,
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.asset('images/flogo.png'),
                  Text(
                    'Login with Facebook',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Opacity(opacity: 0.0, child: Image.asset('images/flogo.png'))
                ],
              ),
              color: Color(0xFF334D92),
              onPressed: () {},
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
          SizedBox(
            height: 10.0,
          ),
          ButtonTheme(
            height: 50.0,
            child: RaisedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.mail, color: Colors.white),
                  Text(
                    'Login with Email',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Icon(Icons.mail, color: Colors.white),
                  )
                ],
              ),
              color: Colors.green[700],
              onPressed: () {},
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
          ),
        ],
      ),
    );
  }
}
