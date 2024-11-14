import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/user_profile/view/add_comment_widget.dart';
import 'package:flutter/material.dart';

final class UserProfileMoreIconAlert {
  void show(BuildContext context, int userId) {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                tileColor: context.themeData.scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                leading: Icon(Icons.comment,
                    color: context.themeData.primaryColor),
                title: Text(
                  'addComment'.tr(),
                  style: context.textTheme.labelLarge,
                ),
                onTap: () async {
                  await context.router.pop();
                  await context.router
                      .pushWidget(AddCommentView(userId: userId));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
