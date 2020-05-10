import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/style/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFeed',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(5, 152, 138, 1.0),
//        primaryColor: Color.fromRGBO(5, 152, 138, 0.1),
        fontFamily: RegularFont,
      ),
      home: HomeScreen(),
    );
  }
}
