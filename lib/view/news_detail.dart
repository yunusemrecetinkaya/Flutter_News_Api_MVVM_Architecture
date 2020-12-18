import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/view_model/news_view_model.dart';

class NewsDetail extends StatelessWidget {
  NewsViewModel item;
  NewsDetail(NewsViewModel item) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          buildAppBar(context),
          buildNewsImage(size),
          buildNewsDate(),
          buildNewsHeader(),
          buildNewsContent(),
        ],
      ),
    );
  }

  SafeArea buildAppBar(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Author'),
                Text(
                  item.author,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                child: Image.network(
                    'https://image.flaticon.com/icons/png/512/194/194938.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildNewsImage(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: CachedNetworkImage(
        imageUrl: item.urlToImage,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
        imageBuilder: (context, imageProvider) {
          return Container(
            height: size.height * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildNewsDate() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        child: Text(
          formatDate(DateTime.parse(item.publishedAt),
              [yyyy, '/', mm, '/', dd, '  ', hh, ':', nn]),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Padding buildNewsHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        child: Text(
          item.title,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Padding buildNewsContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: SizedBox(
        child: Text(
          item.description,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
