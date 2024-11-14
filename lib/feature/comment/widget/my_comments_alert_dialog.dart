import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/feature/comment/view_model/my_comments_view_model.dart';
import 'package:findpro/feature/comment/widget/alert_dialog_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCommentsAlertDialog {
  void show({
    required BuildContext context,
    required WidgetRef ref,
    required int commentId,
  }) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            color: Colors.transparent,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AlertDialogListTile(
                  iconData: Icons.delete_forever,
                  text: 'deleteComment'.tr(),
                  onTap: () async {
                    final res = await ref
                        .read(myCommentsProvider.notifier)
                        .deleteComment(commentId);
                    await context.router.pop();
                    if (res) {
                      InformationToast().show(
                          context, 'commentDeletedSuccessfully'.tr());
                    } else {
                      InformationToast()
                          .show(context, 'anErrorOccurred'.tr());
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//   AlertDialogListTile(
//                   iconData: Icons.report_gmailerrorred,
//                   text: 'reportComment'.tr(),
//                   onTap: () async {
//                     final userId = CacheManager.instance.getUserId();
//                     final res = await SupportService.instance.comment(
//                         userId, commentId, LocaleKeys.harmfulContent);
//                     await context.router.pop();
//                     if (res!.success) {
//                       InformationToast().show(
//                           context, LocaleKeys.commentReported);
//                     } else {
//                       InformationToast()
//                           .show(context, LocaleKeys.anErrorOccurred);
//                     }
//                   },
//                 ),
