import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/init/localization/app_localization.dart';
import 'package:findpro/common/init/product_init.dart';
import 'package:findpro/common/router/app_router.dart';
import 'package:findpro/common/theme/dark_theme_manager.dart';
import 'package:findpro/common/theme/light_theme_manager.dart';
import 'package:findpro/common/widget/custom_responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await ProductInitialization.mainInit();
  runApp(
    ProductLocalization(child: const ProviderScope(child: _MyApp())),
  );
}

class _MyApp extends ConsumerWidget {
  const _MyApp();

  static final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomResponsive(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: LightThemeManager().themeData,
        darkTheme: DarkThemeManager().themeData,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
