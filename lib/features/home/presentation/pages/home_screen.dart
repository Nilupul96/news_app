import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/core/helpers/extentions.dart';
import 'package:news_app/features/home/presentation/widgets/top_news_list_tile.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/const/app_const.dart';
import '../../../../core/shimmers/home_shimmer.dart';
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
  final controller = PageController(keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppConst.appName,
              style: TextStyle(
                  fontFamily: 'Blackness',
                  color: AppColors.primaryRed,
                  fontSize: 36.sp)),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoading) {
        return const HomeShimmer();
      }
      if (state is HomeError) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${state.exception?.message}'),
              SizedBox(height: 20),
              InkWell(
                  onTap: () {
                    BlocProvider.of<HomeBloc>(context, listen: false)
                        .add(const SetHomeScreenLoading());
                    BlocProvider.of<HomeBloc>(context, listen: false)
                        .add(const GetTopArticles());
                  },
                  child: Text(
                    'Try again',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(color: AppColors.primaryRed),
                  )),
            ],
          ),
        );
      }
      if (state is HomeSuccess) {
        return RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<HomeBloc>(context, listen: false)
                .add(const SetHomeScreenLoading());
            BlocProvider.of<HomeBloc>(context, listen: false)
                .add(const GetTopArticles());
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: ScrollController(),
            slivers: [
              MultiSliver(
                children: [
                  _buildTopNewsSection(state),
                  SliverPinnedHeader(child: _categoryMenuList()),
                  const RSizedBox(
                    height: 20,
                  ),
                  _buildNewsListByCategory(state),
                  const RSizedBox(
                    height: 20,
                  ),
                ],
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
      child: Stack(
        children: [
          PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: state.articleList!.length > 10
                  ? 10
                  : state.articleList!.length,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return TopNewsListTile(article: state.articleList![index]);
              }),
          Positioned(
              bottom: 20.h,
              left: 0,
              right: 0,
              child: SizedBox(
                width: ScreenUtil().screenWidth - 40.w,
                child: Center(
                  child: SmoothPageIndicator(
                      controller: controller,
                      count: state.articleList!.length > 10
                          ? 10
                          : state.articleList!.length,
                      effect: WormEffect(
                          dotWidth: 20.w,
                          type: WormType.thinUnderground,
                          activeDotColor: AppColors.primaryRed,
                          dotColor: AppColors.lightBlue,
                          spacing: 1,
                          radius: 5,
                          dotHeight: 5),
                      onDotClicked: (index) {}),
                ),
              ))
        ],
      ),
    );
  }

  Widget _categoryMenuList() {
    return Container(
      color: context.isDark ? AppColors.black : Colors.white,
      margin: const EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(top: 20.h, bottom: 10),
      height: 70.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppConst.CATEGORY_MENU_LIST.length,
          primary: true,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? AppColors.darkblue
                        : AppColors.lightBlue.withOpacity(0.9),
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
