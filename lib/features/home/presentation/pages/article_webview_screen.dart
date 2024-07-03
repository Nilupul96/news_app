import 'package:flutter/material.dart';

class ArticleWebScreen extends StatefulWidget {
  static const routeName = "/article-web-screen";
  const ArticleWebScreen({Key? key}) : super(key: key);

  @override
  State<ArticleWebScreen> createState() => _ArticleWebScreenState();
}

class _ArticleWebScreenState extends State<ArticleWebScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [],
      ),
    );
  }
}
