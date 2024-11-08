import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionAlert {
  void show(BuildContext context, String question, VoidCallback onTap) {
    showCupertinoDialog<Widget>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            LocaleKeys.warning,
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
                LocaleKeys.okay,
                style: context.themeData.textTheme.labelLarge
                    ?.copyWith(color: Colors.red),
              ),
            ),
            CupertinoDialogAction(
              onPressed: onTap,
              child: Text(
                LocaleKeys.cancel,
                style: context.themeData.textTheme.labelLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
