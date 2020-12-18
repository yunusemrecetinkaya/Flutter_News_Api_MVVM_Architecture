import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api/view_model/news_view_model.dart';

class LoadingImage extends StatelessWidget {
  NewsViewModel item;
  LoadingImage(NewsViewModel item) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: item.urlToImage,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              )),
        );
      },
    );
  }
}
