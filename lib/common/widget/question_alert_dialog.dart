import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
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
            LocaleKeys.warning,
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
                LocaleKeys.cancel,
                style: context.textTheme.headlineSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
