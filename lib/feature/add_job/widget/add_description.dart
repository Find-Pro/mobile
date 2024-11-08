import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDescription extends ConsumerWidget {
  const AddDescription({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final descriptionCnt = TextEditingController();
    final addJobViewModel = ref.read(addJobProvider.notifier);

    return Padding(
      padding: PaddingInsets().xxl,
      child: Column(
        children: [
          TextField(
            style: context.textTheme.headlineSmall,
            controller: descriptionCnt,
            onChanged: (text) {
              ref.read(addJobProvider.notifier).description = text;
            },
          ),
          50.verticalSpace,
          SettingsConfirmButton(
            text: LocaleKeys.createService,
            onTap: () async {
              if (descriptionCnt.text.isEmpty) {
                WarningAlert().show(
                    context, LocaleKeys.descriptionIsRequired, false);
              } else {
                addJobViewModel.description = descriptionCnt.text;
                final success = await addJobViewModel.createService();
                if (success) {
                  InformationToast().show(
                      context, LocaleKeys.serviceCreatedSuccessfully);
                  await context.router.pushAndPopUntil(const MainRoute(),
                      predicate: (_) => false);
                } else {
                  WarningAlert()
                      .show(context, LocaleKeys.serviceCouldNotAdd, false);
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
