import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/datasource/remote/remote_data_source_article.dart';
import 'package:news_app/feature/home/viewmodel/article_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  final apiService = ApiService();
  final remoteDatasource = RemoteDatasource(apiService);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ArticleViewModel(remoteDatasource)..fetchNews(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: RoutesManager.onGenerateRoute,
          initialRoute: RoutesManager.categoryScreen,

          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          darkTheme: ThemeManger.dark,
          theme: ThemeManger.light,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: [Locale('en'), Locale('ar'), Locale('es')],
          locale: Locale('en'),
        );
      },
    );
  }
}
