import 'package:news_app/data/datasource/remote/remote_data_source_article.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/repository/article_repository.dart';

class ArticleRepositoryImpl implements  ArticleRepository {
  ArticleRepositoryImpl({required this.dataSource});

 final  RemoteDataSourceArticle dataSource;
  @override
  Future<List<ArticleModel>> getArticle(String idSource) {
    return dataSource.getArticle(idSource);
  }
}
