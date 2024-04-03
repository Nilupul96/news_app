import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/features/home/presentation/widgets/top_news_list_tile.dart';
import '../../../../core/const/app_const.dart';
import '../bloc/home_bloc.dart';
import '../widgets/category_news_list_item.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("NewZ"),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is HomeError) {
        return Center(child: Text('error ${state.exception}'));
      }
      if (state is HomeSuccess) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildTopNewsSection(state),
              const RSizedBox(
                height: 20,
              ),
              _categoryMenuList(),
              const RSizedBox(
                height: 20,
              ),
              _buildNewsListByCategory(state),
              const RSizedBox(
                height: 20,
              ),
            ],
          ),
        );
      }
      return const SizedBox();
    });
  }

  Widget _buildTopNewsSection(HomeSuccess state) {
    return SizedBox(
      height: 450.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.articleList!.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return TopNewsListTile(article: state.articleList![index]);
          }),
    );
  }

  Widget _categoryMenuList() {
    return SizedBox(
      height: 44.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppConst.CATEGORY_MENU_LIST.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Material(
                child: Container(
                  margin: EdgeInsets.only(left: 20.w),
                  decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColors.darkblue
                          : AppColors.primaryGrey,
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.h),
                    child: Text(
                      AppConst.CATEGORY_MENU_LIST[index],
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildNewsListByCategory(HomeSuccess state) {
    return ListView.builder(
        itemCount: state.articleList!.length,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CategoryNewsListTile(article: state.articleList![index]);
        });
  }
}
