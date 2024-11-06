import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/feature/home/widget/nav_bar_item.dart';
import 'package:findpro/feature/settings/view/settings_view.dart';
import 'package:findpro/generated/assets.dart';
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
          ?.copyWith(fontSize: 9, color: Colors.blue),
      unselectedLabelStyle: context.themeData.textTheme.labelSmall
          ?.copyWith(fontSize: 9, color: Colors.grey),
      unselectedItemColor: context.themeData.indicatorColor,
      selectedItemColor: Colors.blue,
      selectedIconTheme: const IconThemeData(color: Colors.white),
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      elevation: 10,
      backgroundColor: context.themeData.scaffoldBackgroundColor,
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
          image: Assets.iconDiscovery,
          text: LocaleKeys.home,
          isActive: tabsRouter.activeIndex == 0,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: Assets.iconSearchIcon,
          text: LocaleKeys.search,
          isActive: tabsRouter.activeIndex == 1,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: Assets.iconMessages,
          text: LocaleKeys.messages,
          isActive: tabsRouter.activeIndex == 2,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: tabsRouter.activeIndex == 3
              ? Assets.iconSettings
              : Assets.iconProfile,
          text: tabsRouter.activeIndex == 3
              ? LocaleKeys.settings
              : LocaleKeys.profile,
          isActive: tabsRouter.activeIndex == 3,
          isSettings: tabsRouter.activeIndex == 3,
        ).build(context),
      ],
    );
  }
}
