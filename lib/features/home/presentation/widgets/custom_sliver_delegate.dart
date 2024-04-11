import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_colors.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final BuildContext context;
  final String? imageUrl;

  CustomSliverAppBarDelegate({
    required this.context,
    this.imageUrl,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      child: SizedBox(
        width: double.infinity,
        child: imageUrl != null
            ? Hero(
                tag: imageUrl!,
                child: CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                    errorWidget: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.error_outline),
                      );
                    }),
              )
            : Container(
                width: double.infinity,
                height: double.infinity,
                color: AppColors.lightBlue,
                child: Center(
                  child: Icon(
                    Icons.image_not_supported_rounded,
                    color: Colors.black,
                    size: 100.h,
                  ),
                ),
              ),
      ),
    );
  }

  double appear(double shrinkOffset) {
    return shrinkOffset / maxExtent;
  }

  double disappear(double shrinkOffset) {
    return 1 - (shrinkOffset / maxExtent);
  }

  @override
  double get maxExtent => 400.h;

  @override
  double get minExtent => 200.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
