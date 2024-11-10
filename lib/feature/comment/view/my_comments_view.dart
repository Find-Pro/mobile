import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/comment/view_model/my_comments_view_model.dart';
import 'package:findpro/feature/comment/widget/comment_card.dart';
import 'package:findpro/feature/comment/widget/my_comments_alert_dialog.dart';
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
          return const NoDataFoundWidget();
        }
        return ListView.builder(
          itemBuilder: (context, index) => CommentCard(
              commentModel: myCommentViewModel.result![index],
              onTap: () => MyCommentsAlertDialog().show(
                    commentId:
                        myCommentViewModel.result![index].commentId!,
                    context: context,
                    ref: ref,
                  )),
        );
      },
      error: (error, stackTrace) => const NoDataFoundWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
