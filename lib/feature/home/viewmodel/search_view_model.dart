import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/repository/search_repository.dart';

class SearchViewModel extends ChangeNotifier {
  final SearchRepository searchRepository;

  SearchViewModel(this.searchRepository) {
    scrollController.addListener(_onScroll);
  }

  final ScrollController scrollController = ScrollController();

  final TextEditingController textEditingController =
      TextEditingController();

  bool isLoading = false;

  bool hasMore = true;

  int page = 1;

  String currentQuery = '';

  String? errorMessage;

  List<ArticleModel> articles = [];

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      search(query: currentQuery);
    }
  }
void clearSearch() {
  textEditingController.clear();

  articles.clear();

  page = 1;

  hasMore = true;

  currentQuery = '';

  errorMessage = null;

  notifyListeners();
}
  Future<void> newSearch(String query) async {
    page = 1;

    hasMore = true;

    currentQuery = query;

    articles.clear();

    errorMessage = null;

    notifyListeners();

    await search(query: query);
  }

  Future<void> search({
    required String query,
  }) async {
    if (isLoading || !hasMore) return;

    try {
      isLoading = true;

      errorMessage = null;

      notifyListeners();

      final newArticles = await searchRepository.search(
        query,
        page,
      );

      if (page == 1) {
        articles = newArticles;
      } else {
        articles.addAll(newArticles);
      }

      if (newArticles.length < 10) {
        hasMore = false;
      } else {
        page++;
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;

      notifyListeners();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();

    textEditingController.dispose();

    super.dispose();
  }
}