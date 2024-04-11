import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/helpers/extentions.dart';
import 'package:news_app/features/home/presentation/pages/home_screen.dart';

import '../../core/app_colors.dart';
import 'presentation/pages/settings_screen.dart';

class InitScreen extends StatefulWidget {
  static const routeName = "/init-screen";
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    SettingsScreen()
  ];
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: _screens,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true,
          backgroundColor: context.isDark ? AppColors.black : AppColors.white,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
                icon: const Icon(Icons.home_outlined),
                title: const Text('Home'),
                inactiveColor: AppColors.darkblue,
                activeColor: AppColors.primaryRed),
            BottomNavyBarItem(
                icon: const Icon(Icons.search),
                title: const Text('Discover'),
                inactiveColor: AppColors.darkblue,
                activeColor: AppColors.primaryRed),
            BottomNavyBarItem(
                icon: const Icon(Icons.source_outlined),
                title: const Text('Source'),
                inactiveColor: AppColors.darkblue,
                activeColor: AppColors.primaryRed),
            BottomNavyBarItem(
                icon: const Icon(Icons.settings_outlined),
                title: const Text('Settings'),
                inactiveColor: AppColors.darkblue,
                activeColor: AppColors.primaryRed),
          ],
        ));
  }
}
