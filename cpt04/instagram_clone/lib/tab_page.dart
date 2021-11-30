import 'package:flutter/material.dart';
import 'package:instagram_clone/account_page.dart';
import 'package:instagram_clone/home_page.dart';
import 'package:instagram_clone/search_page.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _selectedIndex = 0;
  List _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(),
      SearchPage(),
      AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_selectedIndex]),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildFooter() {
    return BottomNavigationBar(
      fixedColor: Colors.black,
      onTap: _onTapped,
      currentIndex: _selectedIndex, // 이걸 현재 탭 index와 맞춰줘야 현재 탭이 강조됨.
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), title: Text('Search')),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text('Accout')),
      ],
    );
  }

  void _onTapped(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }
}
