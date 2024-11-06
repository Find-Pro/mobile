import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:flutter/cupertino.dart';

final class WarningAlert {
  void show(BuildContext context, String title, bool dismissible) {
    showCupertinoDialog<Widget>(
      context: context,
      barrierDismissible: dismissible,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: context.themeData.textTheme.headlineLarge,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              textStyle: context.themeData.textTheme.headlineSmall,
              onPressed: () => context.router.pop(),
              child: Text(
                LocaleKeys.okay,
                style: context.themeData.textTheme.headlineSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
