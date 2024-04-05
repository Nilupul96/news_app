import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage extends StatelessWidget {
  final List<Widget> textList;
  final String image;
  const OnboardingPage(
      {super.key, required this.textList, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.8),
          image: DecorationImage(
              opacity: 0.3, image: AssetImage(image), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 180.h),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: AnimateList(
                delay: const Duration(milliseconds: 300),
                interval: 400.ms,
                effects: [FadeEffect(duration: 500.ms)],
                children: [...textList],
              )),
        ));
  }
}
