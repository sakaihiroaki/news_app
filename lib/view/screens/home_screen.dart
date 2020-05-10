import 'package:flutter/material.dart';
import 'package:newsapp/view/screens/pages/about_us_page.dart';
import 'package:newsapp/view/screens/pages/head_line_page.dart';
import 'package:newsapp/view/screens/pages/news_list_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final _pages = [
    HeadLinePage(),
    NewsListPage(),
    AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('トップニュース'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('ニュース一覧'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              title: Text('アプリについて'),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
