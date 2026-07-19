import 'dart:developer';

import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/repository/article_repository.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleRepository articleRepository;
  ArticleViewModel(this.articleRepository);

  bool isLoading = false;

  String? errorMessage;

  List<ArticleModel> articles = [];

Future<void> getArticles({required String idSource}) async {
  try {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    articles = await articleRepository.getArticle(idSource);
  } catch (e) {
    errorMessage = e.toString();
    log(e.toString());
  } finally {
    isLoading = false;
    notifyListeners();
  }
}
}
