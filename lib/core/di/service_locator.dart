import 'package:get_it/get_it.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/data/datasource/remote/remote_data_source_sources.dart';
import 'package:news_app/data/datasource/remote/remote_data_source_sources_impl.dart';
import 'package:news_app/data/repository/source_repository.dart';
import 'package:news_app/data/repository/source_repository_impl.dart';
import 'package:news_app/feature/home/viewmodel/source_view_model.dart';

final getIt = GetIt.instance;

void setUp() {
  getIt.registerLazySingleton(() => ApiService());

  getIt.registerLazySingleton<RemoteDataSourceSources>(
    () => RemoteDataSourceSourcesImpl(getIt<ApiService>()),
  );

  getIt.registerLazySingleton<SourceRepository>(
    () => SourceRepositoryImpl(getIt<RemoteDataSourceSources>()),
  );
  getIt.registerFactory(() => SourceViewModel(getIt<SourceRepository>()));
}
