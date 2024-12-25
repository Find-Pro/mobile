import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/bad_words.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/ad/video_ad.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/jobs/add_job/view_model/add_job_view_model.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:findpro/generated/locale_keys.g.dart';
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
              style: context.textTheme.labelLarge,
              controller: descriptionCnt,
              onChanged: (text) {
                ref.read(addJobProvider.notifier).description = text;
              },
              decoration: InputDecoration(
                hintText: LocaleKeys.description.tr(),
                hintStyle: context.themeData.textTheme.labelMedium
                    ?.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: context.themeData.primaryColor,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: BorderSide(
                    color: context.themeData.primaryColor,
                    width: 2,
                  ),
                ),
              )),
          50.verticalSpace,
          SettingsConfirmButton(
            text: LocaleKeys.createService.tr(),
            onTap: () async {
              if (descriptionCnt.text.isEmpty) {
                WarningAlert().show(
                    context, LocaleKeys.descriptionIsRequired.tr(), false);
              } else {
                if (BadWords.containsForbiddenWord(descriptionCnt.text)) {
                  WarningAlert().show(
                      context, LocaleKeys.pleaseAvoidBadWords.tr(), true);
                } else {
                  addJobViewModel.description = descriptionCnt.text;
                  final success = await addJobViewModel.createService();
                  if (success) {
                    InformationToast().show(context,
                        LocaleKeys.serviceCreatedSuccessfully.tr());
                    await context.router.pushAndPopUntil(const MainRoute(),
                        predicate: (_) => false);
                    if (context.mounted) {
                      await context.router.pushWidget(const VideoAdView());
                    }
                  } else {
                    WarningAlert().show(context,
                        LocaleKeys.serviceCouldNotAdd.tr(), false);
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
