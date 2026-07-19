import 'package:news_app/data/datasource/remote/remote_data_source_search.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  RemoteDataSourceSearch dataSource;
  SearchRepositoryImpl(this.dataSource);

  @override
  Future<List<ArticleModel>> search(String query, int page) {
    return dataSource.search(page: page, query: query);
  }
}
