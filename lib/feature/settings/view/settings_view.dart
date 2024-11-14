import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/question_alert_dialog.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/helper/sign_out.dart';
import 'package:findpro/feature/settings/view_model/remove_account_view_model.dart';
import 'package:findpro/feature/settings/widget/change_language_dialog.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/feature/settings/widget/settings_divider.dart';
import 'package:findpro/feature/settings/widget/settings_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingsView extends ConsumerWidget {
  const SettingsView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: SettingsAppBar(text: 'settings'.tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: PaddingInsets().xxl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SettingsListTile(
                  iconData: Icons.color_lens_outlined,
                  text: 'themeSettings'.tr(),
                  onTap: () =>
                      context.router.push(const ThemeSettingsRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.key,
                  text: 'changePassword'.tr(),
                  onTap: () =>
                      context.router.push(const ChangePasswordRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.edit_note,
                  text: 'editProfile'.tr(),
                  onTap: () =>
                      context.router.push(const EditProfileRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.business_center_outlined,
                  text: 'createService'.tr(),
                  onTap: () => context.router.push(const AddJobRoute())),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.language,
                  text: 'changeLanguage'.tr(),
                  onTap: () => ChangeLanguageDialog().show(context)),
              const SettingsDivider(),
              SettingsListTile(
                  iconData: Icons.highlight_remove_outlined,
                  iconColor: Colors.red,
                  text: 'removeAccount'.tr(),
                  onTap: () => QuestionAlertDialog().show(context,
                          onTap: () async {
                        final res = await ref
                            .read(removeAccountProvider.notifier)
                            .remove();
                        if (res) {
                          await context.router.pushAndPopUntil(
                              const LoginRoute(),
                              predicate: (_) => false);
                        } else {
                          WarningAlert().show(
                              context, 'anErrorOccurred'.tr(), false);
                        }
                      },
                          bodyText: 'areYouSureSignOut'.tr(),
                          buttonText: 'signOut'.tr())),
              const SettingsDivider(),
              SettingsListTile(
                  iconColor: Colors.red,
                  iconData: Icons.sign_language_outlined,
                  text: 'signOut'.tr(),
                  onTap: () => QuestionAlertDialog().show(context,
                      onTap: () => SignOut.instance.signOut(context),
                      bodyText: 'areYouSureSignOut'.tr(),
                      buttonText: 'signOut')),
            ],
          ),
        ),
      ),
    );
  }
}
