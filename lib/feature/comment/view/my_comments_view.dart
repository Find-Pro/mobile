import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/comment/view_model/my_comments_view_model.dart';
import 'package:findpro/feature/comment/widget/comment_card.dart';
import 'package:findpro/feature/comment/widget/my_comments_alert_dialog.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyCommentsView extends ConsumerWidget {
  const MyCommentsView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myCommentViewModel = ref.watch(myCommentsProvider);
    final myCommentFuture = ref.watch(myCommentsFutureProvider);
    return myCommentFuture.when(
      data: (_) {
        if (myCommentViewModel.result == null ||
            myCommentViewModel.result!.isEmpty) {
          return NoDataWidget(text: LocaleKeys.noCommentsFound.tr());
        }
        return Stack(
          children: [
            const HomeBackgroundImage(),
            ListView.builder(
              itemCount: myCommentViewModel.result!.length,
              itemBuilder: (context, index) => CommentCard(
                  commentModel: myCommentViewModel.result![index],
                  onTap: () => MyCommentsAlertDialog().show(
                        commentId:
                            myCommentViewModel.result![index].commentId!,
                        context: context,
                        ref: ref,
                      )),
            ),
          ],
        );
      },
      error: (error, stackTrace) => NoDataWidget(
        text: LocaleKeys.noCommentsFound.tr(),
      ),
      loading: () => const CustomCircular(),
    );
  }
}
