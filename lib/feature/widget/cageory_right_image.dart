import 'package:news_app/core/const/assets/images/app_images.dart';
import 'package:news_app/core/theme/app_light_color.dart';

import '../../core/shared/shared.dart';

class CageoryRightImage extends StatelessWidget {
  CageoryRightImage({
    super.key,
    required this.text,

    required this.imageDecoration,
    required this.onTap,
  });
  final String imageDecoration;
  final String text;
  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final appLocalizations = AppLocalizations.of(context)!;

    return Container(
      clipBehavior: Clip.antiAlias,
      height: 198.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          alignment: AlignmentDirectional.topStart,
          image: AssetImage(imageDecoration),
        ),
        color: colors.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Align(
          alignment: AlignmentGeometry.centerEnd,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text, style: textTheme.displayLarge),

              GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 170.w,
                  height: 54.h,
                  decoration: BoxDecoration(
                    color: colors.secondary,
                    borderRadius: BorderRadius.circular(84.r),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(9.r),
                        child: Text(
                          appLocalizations.view_all,
                          style: textTheme.headlineMedium,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        width: 54.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors.surface,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 24.sp,
                            color: colors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
