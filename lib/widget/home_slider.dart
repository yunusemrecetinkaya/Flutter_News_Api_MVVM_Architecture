import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/view/news_detail.dart';
import 'package:flutter_news_api/view_model/news_list_view_model.dart';

import 'loading_image.dart';

class HomeSlider extends StatelessWidget {
  NewsListViewModel newsItem;

  HomeSlider(NewsListViewModel newsItem) {
    this.newsItem = newsItem;
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: newsItem.appleArticle.length,
      itemBuilder: (BuildContext context, int itemIndex) {
        var item = newsItem.appleArticle[itemIndex];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => NewsDetail(item))),
          child: GridTile(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: LoadingImage(item),
            ),
            footer: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * .5,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
