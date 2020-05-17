import 'package:flutter/material.dart';
import 'package:newsapp/data/category_info.dart';
import 'package:newsapp/data/search_type.dart';
import 'package:newsapp/models/model/news_model.dart';
import 'package:newsapp/models/repository/news_repository.dart';

class NewsListViewModel extends ChangeNotifier {
  final NewsRepository _repository = NewsRepository();

  SearchType _searchType = SearchType.CATEGORY;
  SearchType get searchType => _searchType;

  Category _category = categories[0];
  Category get category => _category;

  String _keyword = '';
  String get keyword => _keyword;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<Article> _articles = List();
  List<Article> get articles => _articles;

  Future<void> getNews({@required SearchType searchType, String keyword, Category category}) async {
    _searchType = searchType;
    _keyword = keyword;
    _category = category;

    _isLoading = true;
    notifyListeners();

    _articles = await _repository.getNews(
      searchType: _searchType,
      keyword: _keyword,
      category: _category,
    );

    print('searchType: $_searchType / keyword: $_keyword / category: $_category / articles: ${_articles[0].title}');

    _isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _repository.dispose();
    super.dispose();
  }
}
