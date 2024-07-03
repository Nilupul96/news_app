import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback closeSearch;
  final FocusNode searchFocusNode;
  final ValueChanged<String>? onChanged;
  SearchTextField(
      {super.key,
      required this.controller,
      required this.closeSearch,
      required this.onChanged,
      required this.searchFocusNode});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      focusNode: searchFocusNode,
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: 'Search',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          suffixIcon: IconButton(
              onPressed: () {
                controller.clear();
                FocusScope.of(context).unfocus();
                closeSearch();
              },
              icon: const Icon(Icons.close))),
    );
  }
}
