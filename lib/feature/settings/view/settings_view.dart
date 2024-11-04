import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/settings/widget/settings_divider.dart';
import 'package:findpro/feature/settings/widget/settings_list_tile.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsListTile(
                iconData: Icons.color_lens_outlined,
                text: LocaleKeys.themeSettings,
                onTap: () =>
                    context.pushRoute(const ThemeSettingsRoute())),
            const SettingsDivider(),
            SettingsListTile(
                iconData: Icons.key,
                text: LocaleKeys.changePassword,
                onTap: () =>
                    context.pushRoute(const ChangePasswordRoute())),
            const SettingsDivider(),
            SettingsListTile(
                iconData: Icons.edit_note,
                text: LocaleKeys.editProfile,
                onTap: () => context.pushRoute(const EditProfileRoute())),
            const SettingsDivider(),
            SettingsListTile(
                iconData: Icons.sign_language_outlined,
                text: LocaleKeys.signOut,
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
