import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_colors.dart';
import '../../domain/entities/article.dart';

class TopNewsListTile extends StatelessWidget {
  final ArticleEntity article;
  const TopNewsListTile({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: ScreenUtil().screenWidth,
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
                    SizedBox(
                      height: 30.h,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    // Expanded(
                    //   child: Text(article.author ?? '',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .displaySmall!
                    //           .copyWith(color: Colors.grey)),
                    // ),
                    // if (article.publishedAt != null)
                    //   Text(
                    //       '${Utils.getPostFormattedTime(article.publishedAt!)}',
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .displaySmall!
                    //           .copyWith(color: Colors.grey))
                    //   ],
                    // )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
