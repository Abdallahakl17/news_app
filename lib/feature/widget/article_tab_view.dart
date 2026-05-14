import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/feature/home/viewmodel/article_view_model.dart';
import 'package:news_app/feature/widget/article_items.dart';
import 'package:provider/provider.dart';

class ArticlesTab extends StatefulWidget {
  const ArticlesTab({super.key, required this.sourceId});

  final String sourceId;

  @override
  State<ArticlesTab> createState() => _ArticlesTabState();
}

class _ArticlesTabState extends State<ArticlesTab> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ArticleViewModel>().getArticles(
        idSource: widget.sourceId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleViewModel>(
      builder: (context, vm, _) {
       if (vm.isLoading) {
  return const Center(
    child: CircularProgressIndicator(),
  );
}

if (vm.errorMessage != null) {
  return Center(
    child: Text(vm.errorMessage!),
  );
}

if (vm.articles.isEmpty) {
  return const Center(
    child: Text('No Articles Found'),
  );
}

        return ListView.separated(
          itemCount: vm.articles.length,
          separatorBuilder: (_, __) => SizedBox(height: 16.h),
          itemBuilder: (context, index) {
            return ArticleItems(
              article: vm.articles[index],
            );
          },
        );
      },
    );
  }
}