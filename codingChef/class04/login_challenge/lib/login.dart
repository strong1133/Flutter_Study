import 'package:flutter/material.dart';
import 'package:login_challenge/my_button/my_button.dart';

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
          // Button1
          MyButton(
            image: Image.asset('images/glogo.png'),
            text: Text(
              'Login with Google',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            color: Colors.white,
            radius: 4.0,
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          // Button2
          MyButton(
            image: Image.asset('images/flogo.png'),
            text: Text(
              'Login with Facebook',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            color: Color(0xFF334D92),
            radius: 4.0,
            onPressed: () {},
          ),
          SizedBox(
            height: 10.0,
          ),
          // Button3
          MyButton(
            image: Icon(Icons.mail, color: Colors.white),
            text: Text(
              'Login with Email',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            color: Colors.green[700],
            radius: 4.0,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
