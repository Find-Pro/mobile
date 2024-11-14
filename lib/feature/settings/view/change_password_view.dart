import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/feature/auth/widget/pw_text_field.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
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
      appBar: SettingsAppBar(text: 'changePassword'.tr()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PwTextField(controller: pwCnt, hintText: 'password'.tr()),
          50.verticalSpace,
          PwTextField(
              controller: pwAgainCnt, hintText: 'confirmPassword'.tr()),
          70.verticalSpace,
          SettingsConfirmButton(text: 'changePassword'.tr(), onTap: () {}),
        ],
      ),
    );
  }
}
