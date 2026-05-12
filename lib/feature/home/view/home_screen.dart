import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/feature/home/viewmodel/article_view_model.dart';
import 'package:news_app/feature/widget/article_items.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({required this.categoryModel, super.key});
final List<ArticleModel> articles = [];
  final List<SourceModel> tabs = [
    SourceModel(id: '0', name: 'bbc'),
    SourceModel(id: '1', name: 'cnn'),
    SourceModel(id: '2', name: 'fox'),
  ];
  final CategoryModel categoryModel;
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLocalizations.home),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),

        drawer: Drawer(),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TabBar(
                dividerColor: Colors.transparent,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                tabs: tabs.map((source) {
                  return Tab(text: source.name);
                }).toList(),
              ),

         Expanded(
  child: Consumer<ArticleViewModel>(
    builder: (context, vm, _) {
      if (vm.isLoading) {
        return Center(child: CircularProgressIndicator());
      }

      return TabBarView(
        children: tabs.map((source) {
          return ListView.separated(
            itemCount: vm.articles.length,
            itemBuilder: (_, i) {
              return ArticleItems(article: vm.articles[i]);
            }, separatorBuilder: (BuildContext context, int index) {return   SizedBox(height: 16.h,); },
          );
        }).toList(),
      );
    },
  ),
)
            ],
          ),
        ),
      ),
    );
  }
}
