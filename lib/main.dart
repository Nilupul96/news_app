import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_routes.dart';
import 'package:news_app/core/injection_container.dart';
import 'core/app_theme.dart';
import 'features/home/presentation/bloc/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, required this.savedThemeMode});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(392, 783),
        minTextAdapt: true,
        builder: (_, child) {
          return BlocProvider<HomeBloc>(
              create: (context) => sl()..add(const GetArticles()),
              child: AdaptiveTheme(
                light: AppTheme.appLightTheme,
                dark: AppTheme.darkTheme,
                initial: savedThemeMode ?? AdaptiveThemeMode.light,
                builder: (theme, darkTheme) => MaterialApp.router(
                  title: 'Newz',
                  theme: theme,
                  darkTheme: darkTheme,
                  routerConfig: AppRoutes.router,
                ),
              ));
        });
  }
}
