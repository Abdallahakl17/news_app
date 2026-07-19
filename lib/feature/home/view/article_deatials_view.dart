import 'package:flutter/material.dart';
import 'package:news_app/core/shared/shared.dart';
import 'package:news_app/data/models/article_model.dart';
import 'package:news_app/feature/widget/article_items.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key, required this.article});

  final ArticleModel article;

  Future<void> openArticle() async {
    final Uri url = Uri.parse(article.url ?? '');

    await launchUrl(url, mode: LaunchMode.inAppBrowserView);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: REdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),

      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              Container(
                width: 50.w,
                height: 5.h,
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),

              ArticleItems(article: article),

              SizedBox(height: 24.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: openArticle,
                  child: const Text('Read Full Article'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
