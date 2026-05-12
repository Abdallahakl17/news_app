import 'package:news_app/data/models/source_model.dart';

abstract class RemoteDataSourceSources {
  Future<List<SourceModel>> getSources(String category);
}