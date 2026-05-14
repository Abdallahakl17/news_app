import 'package:news_app/data/models/source_model.dart';

class ArticleModel {
  final String? author;
  final String title;
  final String? desc;
  final String publishedAt;
  final String? image;
  final String? url;
  final SourceModel? source;

  ArticleModel({
    this.author,
    this.source,
    required this.title,
    this.desc,
    required this.publishedAt,
    this.image,
    this.url,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: json['source'] != null
          ? SourceModel.fromJson(json['source'])
          : null,
      author: json['author'],
      title: json['title'] ?? '',
      desc: json['description'],
      publishedAt: json['publishedAt'] ?? '',
      image: json['urlToImage'],
      url: json['url'],
    );
  }
}
