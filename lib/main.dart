import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newsapp/view/screens/home_screen.dart';
import 'package:newsapp/view/style/style.dart';
import 'package:newsapp/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<NewsListViewModel>(
      create: (context) => NewsListViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewsFeed',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(5, 152, 138, 1.0),
        accentColor: const Color.fromRGBO(5, 152, 138, 1.0),
        fontFamily: RegularFont,
      ),
      home: HomeScreen(),
    );
  }
}
