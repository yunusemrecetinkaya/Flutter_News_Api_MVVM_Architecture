import 'package:dio/dio.dart';
import 'package:flutter_news_api/models/news_model.dart';
import 'package:flutter_news_api/utils/constants.dart';

class NewsService {
  var dio = Dio();

  Future<List<NewsModel>> fetchNews() async {
    final response = await dio.get(Constants.TOP_HEADER_LINES_URL);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('ERROR.!');
    }
  }

  Future<List<NewsModel>> fetchNewsContry(String country) async {
    final response = await dio.get(Constants.headLinesFor(country));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('ERROR.!');
    }
  }

  Future<List<NewsModel>> fetchAppleNews() async {
    final response = await dio.get(Constants.APPLE_NEWS_URL);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((e) => NewsModel.fromJson(e)).toList();
    } else {
      throw Exception('ERROR.!');
    }
  }
}
