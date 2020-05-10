import 'package:flutter/material.dart';
import 'package:newsapp/data/category_info.dart';
import 'package:newsapp/view/components/category_chips.dart';
import 'package:newsapp/view/components/search_bar.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SearchBar(
              onSearch: (keyword) => getKeyWordNews(context, keyword),
            ),
            CategoryChips(
              onCategorySelected: (category) => getCategoryNews(context, category),
            ),
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        tooltip: '更新',
        onPressed: () => _onRefresh(context),
      ),
    );
  }

  _onRefresh(BuildContext context) {
    print('refresh');
  }

  getKeyWordNews(BuildContext context, keyword) {
    print('getKeyWordNews:${keyword}');
  }

  getCategoryNews(BuildContext context, Category category) {
    print('getCategoryNews:${category.nameJp}');
  }
}
