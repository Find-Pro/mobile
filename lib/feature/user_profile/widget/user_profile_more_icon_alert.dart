import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/jobs/view_model/create_chat_room_view_model.dart';
import 'package:findpro/feature/message/view_model/messages_view_model.dart';
import 'package:findpro/feature/user_profile/view/add_comment_widget.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class UserProfileMoreIconAlert {
  void show(BuildContext context, WidgetRef ref, int userId) {
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
              CustomListTile(
                text: LocaleKeys.addComment.tr(),
                icon: Icons.add_box_outlined,
                onTap: () async {
                  await context.router.pop();
                  await context.router
                      .pushWidget(AddCommentView(userId: userId));
                },
              ),
              CustomListTile(
                text: LocaleKeys.sendMessage.tr(),
                icon: Icons.message_outlined,
                onTap: () async {
                  await context.router.pop();
                  final res = await ref
                      .read(createChatRoomProvider.notifier)
                      .create(userId);
                  if (res.success) {
                    await ref
                        .read(messagesProvider.notifier)
                        .getChatRooms();
                    InformationToast()
                        .show(context, LocaleKeys.chatRoomCreated.tr());
                  } else {
                    WarningAlert().show(context,
                        res.message ?? LocaleKeys.error.tr(), false);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    required this.text,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: context.themeData.scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      leading: Icon(icon, color: context.themeData.primaryColor),
      title: Text(
        text,
        style: context.textTheme.labelLarge,
      ),
      onTap: onTap,
    );
  }
}
