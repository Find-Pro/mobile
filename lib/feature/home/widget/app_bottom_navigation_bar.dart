import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/home/widget/nav_bar_item.dart';
import 'package:findpro/generated/assets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
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
          if (CacheManager.instance.getIsLoggedIn()) {
            context.router.pushAndPopUntil(const SettingsRoute(),
                predicate: (_) => false);
          }
        } else {
          tabsRouter.setActiveIndex(value);
        }
      },
      items: [
        NavBarItem(
          image: Assets.iconDiscovery,
          text: LocaleKeys.home.tr(),
          isActive: tabsRouter.activeIndex == 0,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: Assets.iconSearchIcon,
          text: LocaleKeys.search.tr(),
          isActive: tabsRouter.activeIndex == 1,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: Assets.iconMessages,
          text: LocaleKeys.messages.tr(),
          isActive: tabsRouter.activeIndex == 2,
          isSettings: false,
        ).build(context),
        NavBarItem(
          image: tabsRouter.activeIndex == 3
              ? Assets.iconSettings
              : Assets.iconProfile,
          text: tabsRouter.activeIndex == 3
              ? LocaleKeys.settings.tr()
              : LocaleKeys.profile.tr(),
          isActive: tabsRouter.activeIndex == 3,
          isSettings: tabsRouter.activeIndex == 3,
        ).build(context),
      ],
    );
  }
}
