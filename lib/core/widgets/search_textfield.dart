import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  SearchTextField({super.key, required this.controller});
  final FocusNode searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      focusNode: FocusNode(),
      decoration: InputDecoration(
          hintText: 'Search',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          suffixIcon: controller.text.trim().isNotEmpty
              ? IconButton(
                  onPressed: () {
                    controller.clear();
                  },
                  icon: const Icon(Icons.close))
              : null),
    );
  }
}
