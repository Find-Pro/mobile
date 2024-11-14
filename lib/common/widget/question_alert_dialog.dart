import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/material.dart';

final class QuestionAlertDialog {
  Future<void> show(
    BuildContext context, {
    required String bodyText,
    required String buttonText,
    required VoidCallback onTap,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'warning'.tr(),
            style: context.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            bodyText,
            style: context.textTheme.headlineSmall,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: onTap,
              child: Text(
                buttonText,
                style: context.textTheme.headlineSmall
                    ?.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () => context.router.pop(),
              child: Text(
                'cancel'.tr(),
                style: context.textTheme.headlineSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
