import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/feature/home/viewmodel/search_view_model.dart';
import 'package:news_app/feature/widget/article_items.dart';
import 'package:provider/provider.dart';

class SearchViewScreen extends StatelessWidget {
  const SearchViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SearchViewModel>(
          builder: (context, viewModel, child) {
            return Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: TextField(
                      textInputAction: TextInputAction.search,
                      controller: viewModel.textEditingController,
                      onSubmitted: (value) {
                        viewModel.newSearch(value);
                      },
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          onPressed: () {
                            final query = viewModel.textEditingController.text
                                .trim();
                            if (query.isNotEmpty) {
                              viewModel.newSearch(query);
                            }
                          },
                          icon: Icon(Icons.search),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            viewModel.clearSearch();
                            FocusScope.of(context).unfocus();
                          },
                          icon: Icon(Icons.clear),
                        ),
                        hintText: "Search news...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.r)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        if (viewModel.isLoading && viewModel.articles.isEmpty) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (!viewModel.isLoading &&
                            viewModel.articles.isEmpty) {
                          return const Center(child: Text("No results"));
                        }

                        return ListView.separated(
                          controller: viewModel.scrollController,
                          itemCount:
                              viewModel.articles.length +
                              (viewModel.hasMore ? 1 : 0),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16.h),
                          itemBuilder: (context, index) {
                            if (index < viewModel.articles.length) {
                              return ArticleItems(
                                article: viewModel.articles[index],
                              );
                            }

                            return Padding(
                              padding: REdgeInsets.all(16),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
