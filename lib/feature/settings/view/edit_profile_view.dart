import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/widget/string_text_field.dart';
import 'package:findpro/feature/settings/view_model/edit_profile_view_model.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class EditProfileView extends ConsumerWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileFuture = ref.watch(editProfileFutureProvider);
    final mailCnt = TextEditingController(
        text: ref.watch(editProfileProvider).user?.email ??
            'undefined'.tr());
    final fullNameCnt = TextEditingController(
        text: ref.watch(editProfileProvider).user?.fullName ??
            'undefined'.tr());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: SettingsAppBar(text: 'updateProfile'.tr()),
        backgroundColor: context.themeData.scaffoldBackgroundColor,
        body: profileFuture.when(
            data: (_) {
              if (!ref.watch(editProfileProvider).success) {
                return const NoDataFoundWidget();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StringTextField(
                    controller: mailCnt,
                    hintText: 'email'.tr(),
                    iconData: Icons.email,
                  ),
                  30.verticalSpace,
                  StringTextField(
                    controller: fullNameCnt,
                    hintText: 'fullName'.tr(),
                    iconData: Icons.person_outline,
                  ),
                  30.verticalSpace,
                  SettingsConfirmButton(
                    text: 'updateProfile'.tr(),
                    onTap: () async {
                      final success = await ref
                          .read(editProfileProvider.notifier)
                          .updateProfile(
                            fullNameCnt.text,
                            mailCnt.text,
                          );
                      if (success) {
                        InformationToast()
                            .show(context, 'profileUpdated'.tr());
                      } else {
                        WarningAlert().show(context, 'error'.tr(), true);
                      }
                    },
                  )
                ],
              );
            },
            error: (error, stackTrace) => const NoDataFoundWidget(),
            loading: () => const CustomCircular()));
  }
}
