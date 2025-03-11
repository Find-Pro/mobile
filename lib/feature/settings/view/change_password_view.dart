import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/widget/pw_text_field.dart';
import 'package:findpro/feature/settings/view_model/change_password_view_model.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class ChangePasswordView extends ConsumerWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pwCnt = TextEditingController();
    final pwAgainCnt = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: SettingsAppBar(text: LocaleKeys.changePassword.tr()),
      body: Column(
        children: [
          50.verticalSpace,
          PwTextField(
            controller: pwCnt,
            hintText: LocaleKeys.password.tr(),
          ),
          50.verticalSpace,
          PwTextField(
            controller: pwAgainCnt,
            hintText: LocaleKeys.confirmPassword.tr(),
          ),
          70.verticalSpace,
          SettingsConfirmButton(
              text: LocaleKeys.changePassword.tr(),
              onTap: () async {
                if (pwCnt.text != pwAgainCnt.text) {
                  WarningAlert().show(
                      context, LocaleKeys.passwordsDoNotMatch.tr(), true);
                } else {
                  final res = await ref
                      .read(changePasswordProvider.notifier)
                      .change(pwAgainCnt.text);
                  if (res.success) {
                    InformationToast()
                        .show(context, LocaleKeys.pwChangedSuccess.tr());
                    pwCnt.text = '';
                    pwAgainCnt.text = '';
                  } else {
                    WarningAlert().show(context, res.message!, true);
                  }
                }
              }),
        ],
      ),
    );
  }
}
