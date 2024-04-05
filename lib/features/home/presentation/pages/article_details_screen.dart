import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/domain/entities/article.dart';
import 'package:news_app/features/home/presentation/widgets/custom_sliver_delegate.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final ArticleEntity? article;
  static const routeName = "/article-details-screen";
  const ArticleDetailsScreen({Key? key, this.article}) : super(key: key);

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: widget.article == null
          ? const Center(
              child: Text("No data"),
            )
          : CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                  MultiSliver(
                    pushPinnedChildren: false,
                    children: [
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: CustomSliverAppBarDelegate(
                            context: context,
                            imageUrl: widget.article!.urlToImage),
                      ),
                      SliverPinnedHeader(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                          color: Colors.white,
                          child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                RotateAnimatedText(
                                  '${widget.article!.title}',
                                  rotateOut: false,
                                  textStyle: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(color: Colors.black),
                                ),
                              ]),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                            child: Column(
                              children: [
                                Text(
                                  '${widget.article!.author ?? ''}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  '${widget.article!.description}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.black),
                                ),
                                Text(
                                  '${widget.article!.content}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall!
                                      .copyWith(color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20.h,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
    );
  }
}
