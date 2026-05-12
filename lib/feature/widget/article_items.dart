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
        border: Border.all(color: colors.onSurface),

        borderRadius: BorderRadius.circular(16.r),
      ),
      height: 322.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            article.image != null
                ? Image.network(
                    article.image!,
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Container(
                    height: 180.h,
                    color: Colors.grey,
                    child: Icon(Icons.image_not_supported),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Text(article.title),
            ),
            Row(
              children: [
                Text('${article.author}'),
                Spacer(),
                Text(article.publishedAt?.split('T').first ?? ''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
