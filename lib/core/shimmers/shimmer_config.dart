import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerConfig {
  static ShimmerDirection shimmerDirection = ShimmerDirection.ltr;
  static Color baseColor = Colors.grey.shade300;
  static Color highlightColor = Colors.grey.shade100;
  static Color darkModeBaseColor = Colors.grey.shade800;
  static Color darkModeHighlightColor = Colors.grey.shade600;
  static Duration period = Duration(milliseconds: 1500);
}
