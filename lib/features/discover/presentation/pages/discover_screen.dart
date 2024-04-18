import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/app_assets.dart';
import 'package:news_app/features/discover/presentation/pages/news_by_category_screen.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/const/app_const.dart';

class DiscoverScreen extends StatefulWidget {
  static const routeName = "/discover-screen";
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.8),
                padding: const EdgeInsets.all(8.0),
                physics: const ClampingScrollPhysics(),
                itemCount: AppConst.CATEGORY_MENU_LIST.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context.pushNamed(
                        NewsByCategoryScreen.routeName,
                        extra: AppConst.CATEGORY_MENU_LIST[index],
                      );
                    },
                    child: Card(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      elevation: 10,
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.black,
                            image: DecorationImage(
                                opacity: 0.3,
                                image: AssetImage(AppAssets.onboarding2),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Hero(
                            tag: AppConst.CATEGORY_MENU_LIST[index],
                            child: Text(
                              AppConst.CATEGORY_MENU_LIST[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
