import 'package:flutter/material.dart';
import 'package:flutter_news_api/view/news_detail.dart';
import 'package:flutter_news_api/view_model/news_list_view_model.dart';

import 'loading_image.dart';

class HomeGridView extends StatelessWidget {
  NewsListViewModel newsItem;
  HomeGridView(NewsListViewModel newsItem) {
    this.newsItem = newsItem;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: newsItem.article.length,
      itemBuilder: (BuildContext context, int index) {
        var item = newsItem.article[index];
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => NewsDetail(item)));
          },
          child: GridTile(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: LoadingImage(item),
            ),
            footer: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
