import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData appLightTheme = ThemeData(
      fontFamily: 'Montserrat',
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      textTheme: textTheme());

  static TextTheme textTheme() => TextTheme(
      displayLarge: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20.sp),
      displayMedium: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          fontSize: 16.sp),
      displaySmall: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          fontSize: 14.sp));

  static AppBarTheme appBarTheme() =>
      const AppBarTheme(backgroundColor: Colors.white);
}
