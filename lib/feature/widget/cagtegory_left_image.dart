import 'package:news_app/core/const/assets/images/app_images.dart';

import '../../core/shared/shared.dart';

class CagtegoryLeftImage extends StatelessWidget {
  CagtegoryLeftImage({
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
    final appLocalizations = AppLocalizations.of(context)!;
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      height: 198.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          alignment: AlignmentDirectional.topEnd,
          image: AssetImage(imageDecoration),
        ),
        color: colors.primary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Align(
          alignment: AlignmentGeometry.bottomStart,
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
                      Container(
                        width: 54.w,
                        height: 54.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colors.surface,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 24.sp,
                            color: colors.primary,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(9.r),
                        child: Text(
                          appLocalizations.view_all,
                          style: textTheme.headlineMedium,
                        ),
                      ),

                      const Spacer(),
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
