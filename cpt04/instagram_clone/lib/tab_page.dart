import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('body area'),
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildFooter() {
    return BottomNavigationBar(
      fixedColor: Colors.black,
      onTap: null,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text('Accout')),
      ],
    );
  }
}
