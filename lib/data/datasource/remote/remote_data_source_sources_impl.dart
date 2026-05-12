import 'dart:developer';

import 'package:news_app/core/const/api_constants.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/data/datasource/remote/remote_data_source_sources.dart';
import 'package:news_app/data/models/source_model.dart';
class RemoteDataSourceSourcesImpl implements RemoteDataSourceSources {
  final ApiService apiService;

  RemoteDataSourceSourcesImpl(this.apiService);

  @override
  Future<List<SourceModel>> getSources(String category) async {
    final response = await apiService.getData(
      path: ApiConstants.sources,
      query: {
        'apiKey': ApiConstants.apiKey,
        'category': category,
      },
    );

    final List sources = response.data['sources'];

    return sources
        .map((source) => SourceModel.fromJson(source))
        .toList();
  }
}