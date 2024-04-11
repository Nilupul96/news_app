import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/home/presentation/pages/article_details_screen.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/helpers/utils.dart';
import '../../domain/entities/article.dart';

class CategoryNewsListTile extends StatelessWidget {
  final ArticleEntity article;
  const CategoryNewsListTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.pushNamed(ArticleDetailsScreen.routeName, extra: article),
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 0, 20.w, 16.h),
        padding: const EdgeInsets.all(16),
        height: 150.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.lightBlue.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
                child: article.urlToImage != null
                    ? Hero(
                        tag: article.urlToImage!,
                        child: CachedNetworkImage(
                          imageUrl: article.urlToImage!,
                          fit: BoxFit.cover,
                          errorWidget: (context, error, stackTrace) {
                            return const Center(
                              child: Icon(Icons.error_outline),
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            RSizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${article.title}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.displayMedium!,
                  ),
                  if (article.publishedAt != null)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          '${Utils.getPostFormattedTime(article.publishedAt!)}',
                          style: Theme.of(context).textTheme.displaySmall!),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
