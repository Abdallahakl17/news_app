import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/article_model.dart';

class ArticleItems extends StatelessWidget {
  const ArticleItems({super.key, required this.article});
  final ArticleModel article;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: const Color.fromARGB(31, 168, 166, 166),
          ),
        ],
        border: Border.all(color: colors.onSurface),

        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 322.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            SizedBox(
              height: 220.h,

              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: CachedNetworkImage(
                  imageUrl: article.image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      Icon(Icons.image_not_supported, size: 100.w),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(
                style: Theme.of(context).textTheme.bodyLarge,
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Text(
                    style: Theme.of(context).textTheme.bodySmall,
                    "By: ${article.author ?? 'Unknown'}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Spacer(),
                Text(
                  style: Theme.of(context).textTheme.bodySmall,
                  article.publishedAt?.split('T').first ?? 'Unknown date',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
