import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/services/model/user_model.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/give_information_dialog.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/widget/string_text_field.dart';
import 'package:findpro/feature/settings/view_model/edit_profile_view_model.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditProfileView extends ConsumerWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editProfileViewModel = EditProfileViewModel();
    final mailCnt = TextEditingController(
        text: ref.watch(editProfileProvider).user?.email ??
            LocaleKeys.undefined);
    final fullNameCnt = TextEditingController(
        text: ref.watch(editProfileProvider).user?.fullName ??
            LocaleKeys.undefined);
    return Scaffold(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          StringTextField(
            controller: mailCnt,
            hintText: LocaleKeys.email,
            iconData: Icons.email,
          ),
          30.verticalSpace,
          StringTextField(
            controller: fullNameCnt,
            hintText: LocaleKeys.fullName,
            iconData: Icons.person_outline,
          ),
          30.verticalSpace,
          if (editProfileViewModel.loadingNotifier.value)
            const CustomCircular(),
          SettingsConfirmButton(
            text: LocaleKeys.updateProfile,
            onTap: () async {
              final success = await ref
                  .read(editProfileProvider.notifier)
                  .updateProfile(UserModel(
                    email: mailCnt.text,
                    fullName: fullNameCnt.text,
                  ));
              if (success) {
                GiveInformationDialog()
                    .show(context, LocaleKeys.profileUpdated);
              } else {
                WarningAlert().show(context, LocaleKeys.error,
                    LocaleKeys.pleaseTryAgain, context.router.pop, true);
              }
            },
          )
        ],
      ),
    );
  }
}
