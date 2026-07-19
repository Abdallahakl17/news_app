import 'package:news_app/data/models/article_model.dart';

abstract class SearchRepository {
  Future<List<ArticleModel>> search(String query, int page);
}
