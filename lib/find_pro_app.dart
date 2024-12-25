import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/router/router_provider.dart';
import 'package:findpro/common/theme/dark_theme_manager.dart';
import 'package:findpro/common/theme/light_theme_manager.dart';
import 'package:findpro/common/widget/custom_responsive.dart';
import 'package:findpro/common/widget/main_build.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FindProApp extends ConsumerWidget {
  const FindProApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Listener(
      onPointerDown: (_) {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: CustomResponsive(
        child: MaterialApp.router(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          theme: LightThemeManager().themeData,
          darkTheme: DarkThemeManager().themeData,
          supportedLocales: context.supportedLocales,
          routerDelegate: ref.read(routerProvider).delegate(),
          routeInformationParser:
              ref.read(routerProvider).defaultRouteParser(),
          debugShowCheckedModeBanner: false,
          builder: MainBuild.build,
        ),
      ),
    );
  }
}
