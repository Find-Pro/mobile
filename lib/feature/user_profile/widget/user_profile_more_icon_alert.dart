import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/message/view_model/block_view_model.dart';
import 'package:findpro/feature/message/view_model/chat_view_model.dart';
import 'package:findpro/feature/message/widget/alert_dialog_list_tile.dart';
import 'package:findpro/feature/user_profile/view/add_comment_widget.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class UserProfileMoreIconAlert {
  void show(BuildContext context, WidgetRef ref, int userId) {
    ref.watch(blockFutureProvider(userId));
    final isBlockedViewModel = ref.watch(blockProvider);
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
              AlertDialogListTile(
                text: LocaleKeys.addComment.tr(),
                icon: Icons.add_box_outlined,
                onTap: () async {
                  await context.router.pop();
                  await context.router
                      .pushWidget(AddCommentView(userId: userId));
                },
              ),
              AlertDialogListTile(
                text: LocaleKeys.sendMessage.tr(),
                icon: Icons.message_outlined,
                onTap: () async {
                  await context.router.pop();
                  final res = await ref
                      .read(chatProvider.notifier)
                      .getChatRoom(userId);
                  if (res) {
                    final chatWithUser = ref.watch(chatProvider);
                    await context.router.pushAndPopUntil(
                        ChatRoute(
                            roomId: chatWithUser.roomId,
                            chatWithUser: chatWithUser),
                        predicate: (_) => false);
                  } else {
                    WarningAlert()
                        .show(context, LocaleKeys.anErrorOccurred, true);
                  }
                },
              ),
              AlertDialogListTile(
                text: isBlockedViewModel
                    ? LocaleKeys.unBlock.tr()
                    : LocaleKeys.block.tr(),
                icon: isBlockedViewModel ? Icons.undo : Icons.block,
                onTap: () async {
                  isBlockedViewModel
                      ? await ref
                          .read(blockProvider.notifier)
                          .unblock(userId)
                      : await ref
                          .read(blockProvider.notifier)
                          .block(userId);
                  await context.router.pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
