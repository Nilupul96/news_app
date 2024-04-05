import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/features/home/presentation/pages/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/widgets/main_btn.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboarding-screen";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          if (!isLastPage)
            InkWell(
              onTap: () {
                controller.jumpToPage(2);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.w),
                child: Text(
                  'Skip',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Colors.white, fontSize: 18.sp),
                ),
              ),
            )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  if (value == 2) {
                    isLastPage = true;
                  } else {
                    isLastPage = false;
                  }
                });
              },
              children: [
                Container(
                    color: AppColors.lightBlue,
                    child: OnboardingPage(
                      image: AppAssets.onboarding4,
                      textList: [
                        Text(
                          "Get the latest",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white, fontSize: 32.sp),
                        ),
                        Text(
                          "news from",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white, fontSize: 32.sp),
                        ),
                        Text("Reliable",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: AppColors.primaryRed,
                                    fontSize: 32.sp)),
                        Text(
                          "Sources",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColors.primaryRed, fontSize: 32.sp),
                        )
                      ],
                    )),
                Container(
                    color: AppColors.lightBlue,
                    child: OnboardingPage(
                      image: AppAssets.onboarding2,
                      textList: [
                        RichText(
                            text: TextSpan(
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        color: Colors.white, fontSize: 32.sp),
                                children: [
                              const TextSpan(text: "still"),
                              TextSpan(
                                  text: " up to date ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          color: AppColors.primaryRed,
                                          fontSize: 32.sp))
                            ])),
                        Text(
                          "news from all",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white, fontSize: 32.sp),
                        ),
                        Text("around the",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: Colors.white, fontSize: 32.sp)),
                        Text(
                          "world",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white, fontSize: 32.sp),
                        )
                      ],
                    )),
                Container(
                    color: AppColors.lightBlue,
                    child:
                        OnboardingPage(image: AppAssets.onboarding3, textList: [
                      Text(
                        "From art to",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.white, fontSize: 32.sp),
                      ),
                      Text("Politics,",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(color: Colors.white, fontSize: 32.sp)),
                      RichText(
                          text: TextSpan(
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      color: Colors.white, fontSize: 32.sp),
                              children: [
                            TextSpan(
                                text: "anything ",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                        color: AppColors.primaryRed,
                                        fontSize: 32.sp)),
                            TextSpan(text: "in"),
                          ])),
                      Text(
                        "NewS4U",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: Colors.white, fontSize: 32.sp),
                      )
                    ]))
              ],
            ),
            Positioned(
                bottom: 40.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      Center(
                        child: SmoothPageIndicator(
                            controller: controller,
                            count: 3,
                            effect: WormEffect(
                                dotWidth: 30.w,
                                type: WormType.thinUnderground,
                                activeDotColor: AppColors.primaryRed,
                                dotColor: AppColors.lightBlue,
                                spacing: 1,
                                radius: 5,
                                dotHeight: 5),
                            onDotClicked: (index) {}),
                      ),
                      RSizedBox(
                        height: 20.h,
                      ),
                      MainBtn(
                        lbl: isLastPage ? "get Started" : "Next",
                        onClick: () {
                          if (isLastPage) {
                            context.goNamed(HomeScreen.routeName);
                            return;
                          }
                          controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
