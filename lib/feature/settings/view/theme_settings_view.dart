import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/settings/widget/change_theme_button.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ThemeSettingsView extends StatelessWidget {
  const ThemeSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    const isDark = false;
    const isLight = false;
    const isSystem = false;
    return Scaffold(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChangeThemeButton(
              imagePath: Assets.iconModeDark,
              isSelected: isDark,
              onTap: () {}),
          ChangeThemeButton(
              imagePath: Assets.iconModeDaytime,
              isSelected: isLight,
              onTap: () {}),
          ChangeThemeButton(
              imagePath: Assets.iconModeSystem,
              isSelected: isSystem,
              onTap: () {}),
        ],
      ),
    );
  }
}
