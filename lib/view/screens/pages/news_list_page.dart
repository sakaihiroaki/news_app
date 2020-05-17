import 'package:flutter/material.dart';
import 'package:newsapp/data/category_info.dart';
import 'package:newsapp/data/search_type.dart';
import 'package:newsapp/models/model/news_model.dart';
import 'package:newsapp/view/components/article_tile.dart';
import 'package:newsapp/view/components/category_chips.dart';
import 'package:newsapp/view/components/search_bar.dart';
import 'package:newsapp/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsListViewModel>(context, listen: false);

    if (!viewModel.isLoading && viewModel.articles.isEmpty) {
      Future(() => viewModel.getNews(searchType: SearchType.CATEGORY, category: categories[0]));
    }

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
              child: Consumer<NewsListViewModel>(
                builder: (context, model, child) {
                  return model.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RefreshIndicator(
                          child: ListView.builder(
                            itemCount: model.articles.length,
                            itemBuilder: (context, int position) => ArticleTile(
                              article: model.articles[position],
                              onArticleClicked: (article) => _openArticleWebPage(article, context),
                            ),
                          ),
                          onRefresh: () => _onRefresh(context),
                        );
                },
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

  Future<void> _onRefresh(BuildContext context) async {
    final NewsListViewModel viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
      searchType: viewModel.searchType,
      keyword: viewModel.keyword,
      category: viewModel.category,
    );
    print('refresh');
  }

  Future<void> getKeyWordNews(BuildContext context, keyword) async {
    final NewsListViewModel viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
      searchType: SearchType.KETWORD,
      keyword: keyword,
      category: categories[0],
    );
    print('getKeyWordNews:${keyword}');
  }

  Future<void> getCategoryNews(BuildContext context, Category category) async {
    final NewsListViewModel viewModel = Provider.of<NewsListViewModel>(context, listen: false);
    viewModel.getNews(
      searchType: SearchType.CATEGORY,
      category: category,
    );
    print('getCategoryNews:${category.nameJp}');
  }

  _openArticleWebPage(Article article, BuildContext context) {
    print('_openArticleWebPage: ${article.url}');
  }
}
