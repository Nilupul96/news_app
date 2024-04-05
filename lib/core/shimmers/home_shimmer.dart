import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/shimmers/shimmer_config.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  final EdgeInsets padding;
  final bool primary;
  final bool shrinkWrap;

  const HomeShimmer(
      {Key? key,
      this.padding = const EdgeInsets.only(right: 10),
      this.primary = false,
      this.shrinkWrap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerConfig.shimmerDirection,
      baseColor: ShimmerConfig.baseColor,
      highlightColor: ShimmerConfig.highlightColor,
      period: ShimmerConfig.period,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Container(
                height: 450.h,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(
                height: 44.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, int index) {
                      return Container(
                        height: 40.h,
                        width: 100.w,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      );
                    }),
              ),
              ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, int index) {
                    return Container(
                      height: 150.h,
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
