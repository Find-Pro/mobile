import 'package:findpro/feature/jobs/add_job/view/add_job_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin AddJobMixin on ConsumerState<AddJobView> {
  final PageController pageController = PageController();
  int currentPageIndex = 0;

  void previousPage() {
    if (currentPageIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
