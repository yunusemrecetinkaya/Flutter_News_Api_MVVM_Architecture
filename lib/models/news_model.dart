class NewsModel {
  final author;
  final title;
  final description;
  final url;
  final urlToImage;
  final publishedAt;
  final content;

  NewsModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  factory NewsModel.fromJson(Map<String, dynamic> map) {
    return NewsModel(
        author: map['author'],
        title: map['title'],
        description: map['description'],
        url: map['url'],
        urlToImage: map['urlToImage'] == null ? null : map['urlToImage'],
        publishedAt: map['publishedAt'],
        content: map['content']);
  }
}
