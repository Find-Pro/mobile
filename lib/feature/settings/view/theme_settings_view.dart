import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/feature/settings/widget/change_theme_button.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ThemeSettingsView extends StatelessWidget {
  const ThemeSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    const isDark = false;
    const isLight = false;
    return Scaffold(
      appBar: SettingsAppBar(text: 'themeSettings'.tr()),
      body: Column(
        children: [
          40.verticalSpace,
          Row(
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
                  isSelected: true,
                  onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
