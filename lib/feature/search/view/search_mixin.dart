import 'package:findpro/feature/search/view/search_input_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin SearchMixin on ConsumerState<SearchInputView> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  void previousPage() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
