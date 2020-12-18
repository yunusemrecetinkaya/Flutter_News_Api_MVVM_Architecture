import 'package:date_format/date_format.dart';
import 'package:flutter_news_api/models/news_model.dart';

class NewsViewModel {
  NewsModel _newsModel;

  NewsViewModel({NewsModel newsModel}) {
    this._newsModel = newsModel;
  }

  String get author {
    return _newsModel.author;
  }

  String get title {
    return _newsModel.title;
  }

  String get description {
    return _newsModel.description;
  }

  String get url {
    return _newsModel.url;
  }

  String get urlToImage {
    return _newsModel.urlToImage;
  }

  String get publishedAt {
    return _newsModel.publishedAt;
  }

  String get content {
    return _newsModel.content;
  }
}
