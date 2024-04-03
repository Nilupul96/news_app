import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/injection_container.dart';
import 'package:news_app/features/home/presentation/pages/home_screen.dart';
import 'core/app_theme.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 783),
        minTextAdapt: true,
        builder: (_, child) {
          return BlocProvider<HomeBloc>(
            create: (context) => sl()..add(GetArticles()),
            child: MaterialApp(
              title: 'Newz',
              theme: AppTheme.appLightTheme,
              home: const HomeScreen(),
            ),
          );
        });
  }
}
