import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/question_alert_dialog.dart';
import 'package:findpro/feature/auth/helper/sign_out.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
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
      appBar: const SettingsAppBar(text: LocaleKeys.settings),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets().xxl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SettingsListTile(
                  iconData: Icons.color_lens_outlined,
                  text: LocaleKeys.themeSettings,
                  onTap: () =>
                      context.router.push(const ThemeSettingsRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.key,
                  text: LocaleKeys.changePassword,
                  onTap: () =>
                      context.router.push(const ChangePasswordRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.edit_note,
                  text: LocaleKeys.editProfile,
                  onTap: () =>
                      context.router.push(const EditProfileRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.business_center_outlined,
                  text: LocaleKeys.createService,
                  onTap: () => context.router.push(const AddJobRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.sign_language_outlined,
                  text: LocaleKeys.signOut,
                  onTap: () => QuestionAlertDialog().show(context,
                      onTap: () => SignOut.instance.signOut(context),
                      bodyText: LocaleKeys.areYouSureSignOut,
                      buttonText: LocaleKeys.signOut)),
            ],
          ),
        ),
      ),
    );
  }
}
