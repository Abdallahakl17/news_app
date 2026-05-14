import 'package:news_app/core/const/api_constants.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/data/datasource/remote/remote_data_source_article.dart';
import 'package:news_app/data/models/article_model.dart';

class RemoteDataSourceArticleImpl implements RemoteDataSourceArticle {
  final ApiService apiService;
  RemoteDataSourceArticleImpl({required this.apiService});
  @override
  Future<List<ArticleModel>> getArticle(String idSource) async {
    final response = await apiService.getData(
      path: ApiConstants.topHeadlines,
      query: {'apiKey': ApiConstants.apiKey, 'sources': idSource},
    );
    final List<dynamic> articles = response.data['articles'];
    return articles.map((article) => ArticleModel.fromJson(article)).toList();
  }
}
