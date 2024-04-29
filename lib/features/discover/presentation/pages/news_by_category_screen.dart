import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/search_textfield.dart';

class NewsByCategoryScreen extends StatefulWidget {
  final String category;
  static const routeName = "/news-by-category";
  const NewsByCategoryScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<NewsByCategoryScreen> createState() => _NewsByCategoryScreenState();
}

class _NewsByCategoryScreenState extends State<NewsByCategoryScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(tag: widget.category, child: Text(widget.category)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SearchTextField(
                    controller: searchController,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
