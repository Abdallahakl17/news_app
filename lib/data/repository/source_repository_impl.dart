import 'package:news_app/data/datasource/remote/remote_data_source_sources.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/data/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  RemoteDataSourceSources dataSource;
  SourceRepositoryImpl(this.dataSource);
  
  @override
  Future<List<SourceModel>> getSources(String category) {
    return dataSource.getSources(category);
  }
}
