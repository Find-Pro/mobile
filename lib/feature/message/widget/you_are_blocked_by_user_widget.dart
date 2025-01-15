import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/home/widget/main_app_bar.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YouAreBlockedByUserWidget extends ConsumerWidget {
  const YouAreBlockedByUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MainAppBar(text: LocaleKeys.error.tr()),
      body: Center(
        child: Text(
          LocaleKeys.youCanNotSendMessage.tr(),
          style: context.textTheme.headlineSmall,
        ),
      ),
    );
  }
}
