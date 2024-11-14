import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
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
              textStyle: context.themeData.textTheme.labelLarge,
              onPressed: () => context.router.pop(),
              child: Text(
                'okay'.tr(),
                style: context.themeData.textTheme.labelLarge,
              ),
            ),
          ],
        );
      },
    );
  }
}
