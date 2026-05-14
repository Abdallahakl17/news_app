import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/feature/home/viewmodel/source_view_model.dart';
import 'package:news_app/feature/widget/article_items.dart';
import 'package:news_app/feature/widget/article_tab_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SourceViewModel>().getSources(
        category: widget.categoryModel.title,
      );
    });
  }

  Widget build(BuildContext context) {
    super.build(context);

    // final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryModel.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutesManager.searchScreen);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Expanded(
            child: Consumer<SourceViewModel>(
              builder: (context, source, _) {
                if (source.isLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                return DefaultTabController(
                  length: source.sources.length,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,

                          tabs: source.sources
                              .map(
                                (e) => SizedBox(
                                  height: 60.h,
                                  child: Tab(text: e.name),
                                ),
                              )
                              .toList(),
                        ),
                        Expanded(
                          child: TabBarView(
                            children: source.sources.map((article) {
                              return ArticlesTab(sourceId: article.id ?? '');
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
