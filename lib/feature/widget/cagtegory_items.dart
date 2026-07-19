import 'package:news_app/data/models/category_model.dart';

import '../../core/shared/shared.dart';

class CagtegoryItem extends StatelessWidget {
  CagtegoryItem({super.key, required this.image, required this.onTap});
  String image;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16.r),

        child: Image.asset( image  , fit: BoxFit.cover),
      ),
    );
  }
}
