import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/feature/auth/widget/pw_text_field.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
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
    // final changePwViewModel = ref.watch(updatePwProvider);
    return Scaffold(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PwTextField(controller: pwCnt, hintText: LocaleKeys.password),
          50.verticalSpace,
          PwTextField(
              controller: pwAgainCnt, hintText: LocaleKeys.password),
          70.verticalSpace,
          SettingsConfirmButton(
              text: LocaleKeys.changePassword, onTap: () {}),
        ],
      ),
    );
  }
}
