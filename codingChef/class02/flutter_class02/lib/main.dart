import 'package:flutter/material.dart';

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
      appBar: AppBar(
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
      ),
      // drawer 메뉴를 추가하면 자동으로 왼쪽에 메뉴 버튼이 생김.
      drawer: Drawer(
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
      ),
    );
  }
}
