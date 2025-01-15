import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/feature/message/view_model/block_view_model.dart';
import 'package:findpro/feature/message/widget/alert_dialog_list_tile.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class ChatMoreIconAlert {
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
