import 'package:news_app/core/const/app_text.dart';
import 'package:news_app/core/const/assets/images/app_images.dart';
import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/category_model.dart';
import 'package:news_app/feature/widget/cagtegory_items.dart';

class CategoryViewScreen extends StatelessWidget {
  CategoryViewScreen({super.key});

  List<CategoryModel> items = [
    CategoryModel(
      id: '0',
      title: AppText.general,
      imageLight: AppLightImage.genral,
      imageLDark: AppDarkImage.genral,
    ),
    CategoryModel(
      id: '1',
      title: AppText.business,
      imageLight: AppLightImage.business,
      imageLDark: AppDarkImage.business,
    ),

    CategoryModel(
      id: '2',
      title: AppText.sports,

      imageLight: AppLightImage.sport,
      imageLDark: AppDarkImage.sport,
    ),

    CategoryModel(
      id: '3',
      title: AppText.technology,
      imageLight: AppLightImage.tech,
      imageLDark: AppDarkImage.tech,
    ),
    CategoryModel(
      id: '4',
      title: AppText.entertainment,
      imageLight: AppLightImage.entertainment,
      imageLDark: AppDarkImage.entertainment,
    ),
    CategoryModel(
      id: '5',
      title: AppText.health,

      imageLight: AppLightImage.health,
      imageLDark: AppDarkImage.health,
    ),

    CategoryModel(
      id: '6',
      title: AppText.science,
      imageLight: AppLightImage.science,
      imageLDark: AppDarkImage.sceince,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final item = items[index];
            return CagtegoryItem(
              image: item.imageLight,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutesManager.homeScreen,
                  arguments: item,
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16.r);
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
