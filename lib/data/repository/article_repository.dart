import 'package:news_app/data/models/article_model.dart';

abstract class ArticleRepository {
  Future<List<ArticleModel>> getArticle(String idSource );
}