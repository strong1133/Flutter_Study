import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      // drawer 메뉴를 추가하면 자동으로 왼쪽에 메뉴 버튼이 생김.
      drawer: _buildDrawer(flag),
      // body: _buildBody02(context),
      body: Center(
        child: FlatButton(
          onPressed: () {
            flutterToast();
          },
          child: Text('Toast'),
          color: Colors.blue,
        ),
      ),
    );
  }

  // AppBar는 AppBar type으로
  AppBar _buildAppBar() {
    return AppBar(
      title: Text("AppBar Icon Menu"),
      centerTitle: true,
      elevation: 0.0,

      //AppBar 왼쪽에 버튼이 생김
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed: () {
      //     print("Menu Button is Clicked");
      //   },
      // ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            print("shopping_cart Button is Clicked");
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            print("search Button is Clicked");
          },
        ),
      ],
    );
  }

  Widget _buildDrawer(flag) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/sj_main.png'),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/truper.png'),
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/baider.png'),
              ),
            ],
            accountName: Text("정석진"),
            accountEmail: Text("strong3879@gmail.com"),
            onDetailsPressed: () {
              if (flag) {
                print("펼쳐졌다!");
                flag = false;
                return;
              }
              print("접혀졌다!");
              flag = true;
            },
            decoration: BoxDecoration(
              color: Colors.red[400],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[850],
            ),
            title: Text('Home'),
            onTap: () {
              print('Home Button 눌림!');
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.grey[850],
            ),
            title: Text('Setting'),
            onTap: () {
              print('Setting 눌림!');
            },
            trailing: Icon(Icons.add),
          ),
          ListTile(
            leading: Icon(
              Icons.question_answer,
              color: Colors.grey[850],
            ),
            title: Text('Q&A'),
            onTap: () {
              print('Q&A 눌림!');
            },
            trailing: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  // Snack Bar with Builder
  Widget _buildBody(context) {
    return Builder(
      builder: (BuildContext ctx) {
        return Center(
          child: FlatButton(
            child: Text(
              'Show Me',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
            onPressed: () {
              Scaffold.of(ctx).showSnackBar(SnackBar(content: Text('Hello')));
            },
          ),
        );
      },
    );
  }

  // Snack Bar without Builder
  Widget _buildBody02(context) {
    return MySnackBar();
  }
}

class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Show Me'),
        onPressed: () {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Hello',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.teal,
              duration: Duration(microseconds: 1000),
            ),
          );
        },
      ),
    );
  }
}

// Toast 메세지
void flutterToast() {
  Fluttertoast.showToast(
      msg: 'Flutter',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
