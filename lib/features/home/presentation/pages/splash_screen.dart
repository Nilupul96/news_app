import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/core/const/app_const.dart';
import 'package:news_app/features/home/presentation/pages/home_screen.dart';
import 'package:news_app/features/home/presentation/pages/onjboarding_screen.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/helpers/app_logger.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash-screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.primaryRed),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              child: Lottie.asset(
                AppAssets.splashAnimation,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  Log.info('$error');
                  return const SizedBox();
                },
              ),
            ),
            const RSizedBox(
              height: 20,
            ),
            AnimatedTextKit(
                isRepeatingAnimation: false,
                onFinished: () {
                  context.goNamed(OnboardingScreen.routeName);
                },
                animatedTexts: [
                  WavyAnimatedText(AppConst.appName,
                      textStyle: TextStyle(
                          fontFamily: 'Blackness',
                          color: Colors.white,
                          fontSize: 60.sp))
                ])
          ],
        ),
      ),
    );
  }
}
