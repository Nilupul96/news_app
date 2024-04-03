import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/helpers/app_logger.dart';
import '../../../../core/helpers/utils.dart';
import '../../domain/entities/article.dart';

class TopNewsListTile extends StatelessWidget {
  final ArticleEntity article;
  const TopNewsListTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    Log.info("url ---${article.urlToImage}");
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      width: ScreenUtil().screenWidth - 40.w,
      decoration: BoxDecoration(
          color: AppColors.lightBlue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25)),
      child: Stack(
        children: [
          if (article.urlToImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: ShaderMask(
                shaderCallback: (rect) => LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.9),
                    Colors.transparent,
                  ],
                ).createShader(rect),
                blendMode: BlendMode.darken,
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage!,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
            ),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${article.title}',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(article.author ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.grey)),
                        ),
                        if (article.publishedAt != null)
                          Text(
                              '${Utils.getPostFormattedTime(article.publishedAt!)}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.grey))
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
