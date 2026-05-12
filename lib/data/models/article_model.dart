import 'package:news_app/data/models/source_model.dart';

class ArticleModel {
  final String? author;
  final String title;
  final String? desc;
  final String publishedAt;
  final String? image;
  final SourceModel? source;

  ArticleModel({
    this.author,
    this.source,
    required this.title,
    this.desc,
    required this.publishedAt,
    this.image,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source: SourceModel.fromJson(json['source']),
      author: json['author'],
      title: json['title'] ?? '',
      desc: json['description'],
      publishedAt: json['publishedAt'] ?? '',
      image: json['urlToImage'],
    );
  }
}
