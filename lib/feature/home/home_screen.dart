import 'package:news_app/core/const/assets/images/app_images.dart';
import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/feature/widget/cageory_right_image.dart';
import 'package:news_app/feature/widget/cagtegory_left_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.home)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CageoryRightImage(
              text: appLocalizations.general,
              imageDecoration: AppImages.earth,
              onTap: () {},
            ),

            SizedBox(height: 16.h),
            CagtegoryLeftImage(
              text: appLocalizations.business,
              imageDecoration: AppImages.bussines,
              onTap: () {},
            ),
            SizedBox(height: 16.h),

            CageoryRightImage(
              text: appLocalizations.sports,
              imageDecoration: AppImages.sport,
              onTap: () {},
            ),

            SizedBox(height: 16.h),
            CagtegoryLeftImage(
              text: appLocalizations.technology,
              imageDecoration: AppImages.tech,
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            CageoryRightImage(
              text: appLocalizations.entertainment,
              imageDecoration: AppImages.entertainment,
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            CagtegoryLeftImage(
              text: appLocalizations.health,
              imageDecoration: AppImages.health,
              onTap: () {},
            ),
            SizedBox(height: 16.h),
            CageoryRightImage(
              text: appLocalizations.science,
              imageDecoration: AppImages.science,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
