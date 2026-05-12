import 'dart:developer';

import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/datasource/remote/remote_data_source_article.dart';
import 'package:news_app/data/models/article_model.dart';

class ArticleViewModel extends ChangeNotifier {
  final  RemoteDatasource  remoteDatasource  ;

  ArticleViewModel(this.remoteDatasource);

  List<ArticleModel> articles = [];
  bool isLoading = false;

  Future<void> fetchNews() async {
    isLoading = true;
    notifyListeners();

    try {
      articles = await  remoteDatasource.getTopHeadlines();
    } catch (e) {
      log( e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}