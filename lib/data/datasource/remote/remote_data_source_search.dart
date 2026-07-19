import 'package:news_app/data/models/article_model.dart';

abstract class RemoteDataSourceSearch {
  Future<List < ArticleModel>> search({required int page, required String query});
}
