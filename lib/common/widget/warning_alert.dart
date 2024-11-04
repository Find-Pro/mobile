import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:flutter/cupertino.dart';

final class WarningAlert {
  void show(BuildContext context, String title, String text,
      VoidCallback onTap, bool dismissible) {
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
              onPressed: onTap,
              child: Text(
                text,
                style: context.themeData.textTheme.headlineSmall,
              ),
            ),
          ],
        );
      },
    );
  }
}
