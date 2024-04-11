import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'shimmer_config.dart';

class ProductItemImageShimmer extends StatelessWidget {
  final double? width;
  final double? height;

  const ProductItemImageShimmer({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerConfig.shimmerDirection,
      baseColor: ShimmerConfig.baseColor,
      highlightColor: ShimmerConfig.highlightColor,
      period: ShimmerConfig.period,
      child: Opacity(
        opacity: 0.7,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
