import 'package:findpro/common/const/device_size.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentAndJobsPageView extends ConsumerStatefulWidget {
  const CommentAndJobsPageView(
      {required this.jobWidget, required this.commentWidget, super.key});
  final Widget jobWidget;
  final Widget commentWidget;

  @override
  ConsumerState createState() => _CommentJobsPageViewState();
}

class _CommentJobsPageViewState
    extends ConsumerState<CommentAndJobsPageView> {
  final PageController pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceSize.height(context) - 300,
      child: Column(
        children: [
          BottomNavigationBar(
            elevation: 0,
            backgroundColor: context.themeData.scaffoldBackgroundColor,
            currentIndex: _selectedIndex,
            selectedFontSize: 13,
            unselectedItemColor: context.themeData.indicatorColor,
            unselectedLabelStyle: context.textTheme.labelLarge,
            selectedLabelStyle: context.textTheme.labelLarge?.copyWith(
                color: Colors.blueAccent, fontWeight: FontWeight.w800),
            onTap: _onBottomNavTapped,
            items: [
              BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.business_center_outlined,
                  color: Colors.blue,
                  size: 25,
                ),
                icon: Icon(
                  Icons.business_center_outlined,
                  color: context.themeData.indicatorColor,
                  size: 25,
                ),
                label: LocaleKeys.jobs,
              ),
              BottomNavigationBarItem(
                activeIcon: const Icon(
                  Icons.comment_outlined,
                  color: Colors.blue,
                  size: 25,
                ),
                icon: Icon(
                  Icons.comment_outlined,
                  color: context.themeData.indicatorColor,
                  size: 25,
                ),
                label: LocaleKeys.comments,
              ),
            ],
          ),
          Expanded(
            flex: 10,
            child: PageView(
              controller: pageController,
              onPageChanged: _onPageChanged,
              children: [
                widget.jobWidget,
                widget.commentWidget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
