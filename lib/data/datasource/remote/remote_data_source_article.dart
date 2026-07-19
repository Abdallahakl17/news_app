import 'package:news_app/data/models/article_model.dart';

abstract class RemoteDataSourceArticle {
  Future<List<ArticleModel>> getArticle(String idSource);
}