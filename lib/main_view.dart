import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/home/widget/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SearchRoute(),
        MessagesRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) {
        return AppBottomNavigationBar(
          tabsRouter: tabsRouter,
          onItemTapped: tabsRouter.setActiveIndex,
          pageIndex: tabsRouter.activeIndex,
        );
      },
    );
  }
}
