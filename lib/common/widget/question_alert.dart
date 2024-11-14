import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionAlert {
  void show(BuildContext context, String question, VoidCallback onTap) {
    showCupertinoDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            'warning'.tr(),
            style: context.themeData.textTheme.headlineMedium,
          ),
          content: Text(
            question,
            style: context.themeData.textTheme.labelLarge,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: onTap,
              child: Text(
                'okay'.tr(),
                style: context.themeData.textTheme.labelLarge
                    ?.copyWith(color: Colors.red),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () => context.router.pop(),
              child: Text(
                'cancel'.tr(),
                style: context.themeData.textTheme.labelLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
