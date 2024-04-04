import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home/domain/entities/article.dart';

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
          : SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      child: SizedBox(
                        width: double.infinity,
                        height: 350.h,
                        child: CachedNetworkImage(
                          imageUrl: widget.article!.urlToImage!,
                          fit: BoxFit.cover,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                      child: Column(
                        children: [
                          Text(
                            '${widget.article!.title}',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(color: Colors.black),
                          ),
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
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
