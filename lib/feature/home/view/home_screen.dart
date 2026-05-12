import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/feature/home/viewmodel/source_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.categoryModel, super.key});

  final CategoryModel categoryModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    // final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryModel.title),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: Drawer(),
      body: Consumer<SourceViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return DefaultTabController(
            length: vm.sources.length,
            child: Column(
              children: [
                TabBar(
                  isScrollable: true,

                  tabs: vm.sources
                      .map(
                        (e) => SizedBox(
                          height: 60.h,
                          child: Tab(text: e.name),
                        ),
                      )
                      .toList(),
                ),
                // Expanded(
                //   child: TabBarView(
                //     children: vm.sources.map((e) {
                //       return Center(
                //         child: Text(
                //           e.name!,
                //           style: Theme.of(context).textTheme.headlineLarge,
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
