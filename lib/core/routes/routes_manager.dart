import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/feature/home/view/article_deatials_view.dart';
import 'package:news_app/feature/home/view/category_view.dart';
import 'package:news_app/feature/home/view/home_screen.dart';
import 'package:news_app/feature/home/view/search_view_screen.dart';

abstract class RoutesManager {
  static const categoryScreen = '/categoryScreen';
  static const homeScreen = '/homeScreen';
  static const searchScreen = '/searchScreen';
  static const articleDetailsView = '/articleDetailsView';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => CategoryViewScreen());
      case categoryScreen:
        return MaterialPageRoute(builder: (_) => CategoryViewScreen());
      case searchScreen:
        return MaterialPageRoute(builder: (_) => SearchViewScreen());
      case articleDetailsView:
        final article = settings.arguments as ArticleModel;
        return MaterialPageRoute(
          builder: (_) => ArticleDetailsView(article: article),
        );
      case homeScreen:
        final category = settings.arguments as CategoryModel;

        return MaterialPageRoute(
          builder: (_) => HomeScreen(categoryModel: category),
        );

      default:
        throw Exception('Route not found');
    }
  }
}
