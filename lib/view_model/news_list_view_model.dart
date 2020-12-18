import 'package:flutter/cupertino.dart';
import 'package:flutter_news_api/models/news_model.dart';
import 'package:flutter_news_api/services/news_service.dart';
import 'package:flutter_news_api/view_model/news_view_model.dart';

enum PageStatus {
  loading,
  completed,
  empty,
}

class NewsListViewModel with ChangeNotifier {
  PageStatus pageStatus = PageStatus.empty;
  List<NewsViewModel> article = List<NewsViewModel>();
  List<NewsViewModel> appleArticle = List<NewsViewModel>();

  fetchArticle() async {
    List<NewsModel> list = await NewsService().fetchNews();
    pageStatus = PageStatus.loading;
    notifyListeners();

    article = list.map((e) => NewsViewModel(newsModel: e)).toList();

    if (article.isEmpty) {
      pageStatus = PageStatus.empty;
    } else {
      pageStatus = PageStatus.completed;
    }
  }

  fetchArticleCountry(String country) async {
    List<NewsModel> list = await NewsService().fetchNewsContry(country);
    pageStatus = PageStatus.loading;
    notifyListeners();

    article = list.map((e) => NewsViewModel(newsModel: e)).toList();

    if (article.isEmpty) {
      pageStatus = PageStatus.empty;
    } else {
      pageStatus = PageStatus.completed;
    }
  }

  fetchAppleArticle() async {
    List<NewsModel> list = await NewsService().fetchAppleNews();
    pageStatus = PageStatus.loading;
    notifyListeners();

    appleArticle = list.map((e) => NewsViewModel(newsModel: e)).toList();

    if (appleArticle.isEmpty) {
      pageStatus = PageStatus.empty;
    } else {
      pageStatus = PageStatus.completed;
    }
  }
}
