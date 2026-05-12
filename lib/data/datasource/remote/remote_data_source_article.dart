import 'package:news_app/core/const/api_constants.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/data/models/article_model.dart';

class RemoteDatasource {
  final ApiService apiService;

  RemoteDatasource(this.apiService);

  Future<List<ArticleModel>> getTopHeadlines() async {
    final response = await apiService.getData(
      path: ApiConstants.topHeadlines,
      query: {"country": "us", "apiKey": ApiConstants.apiKey},
    );

    final List articles = response.data['articles'];

    return articles.map((json) => ArticleModel.fromJson(json)).toList();
  }
}
