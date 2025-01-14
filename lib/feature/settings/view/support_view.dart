import 'package:auto_route/annotations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/bad_words.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/comment/widget/submit_commit_button.dart';
import 'package:findpro/feature/settings/view_model/support_view_model.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SupportView extends ConsumerWidget {
  const SupportView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: SettingsAppBar(text: LocaleKeys.support.tr()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            30.verticalSpace,
            TextFormField(
              style: context.textTheme.labelLarge,
              controller: textController,
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.message),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
              maxLines: 4,
              minLines: 1,
            ),
            30.verticalSpace,
            SubmitCommitButton(
                onTap: () async {
                  if (BadWords.containsForbiddenWord(
                      textController.text)) {
                    WarningAlert().show(context,
                        LocaleKeys.pleaseAvoidBadWords.tr(), true);
                    return;
                  }
                  final res = await SupportViewModel()
                      .sendSupportRequest(textController.text);
                  if (res) {
                    WarningAlert()
                        .show(context, LocaleKeys.success.tr(), true);
                    textController.text = '';
                  } else {
                    WarningAlert().show(
                        context, LocaleKeys.anErrorOccurred.tr(), true);
                  }
                },
                text: LocaleKeys.okay.tr())
          ],
        ),
      ),
    );
  }
}
