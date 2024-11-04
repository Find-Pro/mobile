import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/home/widget/nav_bar_item.dart';
import 'package:findpro/feature/settings/view/settings_view.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    required this.pageIndex,
    required this.onItemTapped,
    required this.tabsRouter,
    super.key,
  });
  final Function onItemTapped;
  final int pageIndex;
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedLabelStyle: context.themeData.textTheme.labelSmall
          ?.copyWith(fontSize: 9, color: Colors.cyan),
      unselectedLabelStyle: context.themeData.textTheme.labelSmall
          ?.copyWith(fontSize: 9, color: context.themeData.indicatorColor),
      unselectedItemColor: context.themeData.indicatorColor,
      selectedItemColor: Colors.cyan,
      selectedIconTheme: const IconThemeData(color: Colors.cyan),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: context.themeData.splashColor,
      currentIndex: tabsRouter.activeIndex,
      onTap: (value) {
        if (tabsRouter.activeIndex == 3 && value == 3) {
          context.router.pushWidget(const SettingsView());
        } else {
          tabsRouter.setActiveIndex(value);
        }
      },
      items: [
        NavBarItem(
          image: 'assets/icon/discovery.png',
          text: 'home',
          isActive: tabsRouter.activeIndex == 0,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: 'assets/icon/search_icon.png',
          text: 'search',
          isActive: tabsRouter.activeIndex == 1,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: 'assets/icon/messages.png',
          text: 'messages',
          isActive: tabsRouter.activeIndex == 2,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: tabsRouter.activeIndex == 3
              ? 'assets/icon/settings.png'
              : 'assets/icon/profile.png',
          text: tabsRouter.activeIndex == 3 ? 'settings' : 'profile',
          isActive: tabsRouter.activeIndex == 3,
          isSettings: tabsRouter.activeIndex == 3,
        ).build(context),
      ],
    );
  }
}
