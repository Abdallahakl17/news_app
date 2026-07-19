import 'package:news_app/core/const/api_constants.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/data/datasource/remote/remote_data_source_search.dart';
import 'package:news_app/data/models/article_model.dart';

class RemoteDataSourceSearchImpl implements RemoteDataSourceSearch {
  final ApiService dataSource;
  RemoteDataSourceSearchImpl({required this.dataSource});

  @override
  Future<List<ArticleModel>> search({
    required int page,
    required String query,
  }) async {
    var response = await dataSource.getData(
      path: ApiConstants.everything,
      query: {
        'apiKey': ApiConstants.apiKey,
        'q': query,
        'page': page,
        'pageSize': '10',
      },
    );
    final List<dynamic> articles = response.data['articles'];

    return articles.map((article) => ArticleModel.fromJson(article)).toList();
  }
}
