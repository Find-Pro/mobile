import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/comment/view_model/general_comments_view_model.dart';
import 'package:findpro/feature/comment/widget/comment_card.dart';
import 'package:findpro/feature/comment/widget/general_comments_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GeneralCommentsView extends ConsumerWidget {
  const GeneralCommentsView({
    required this.userId,
    super.key,
  });
  final int userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generalCommentViewModel = ref.watch(generalCommentsProvider);
    final generalCommentFuture =
        ref.watch(generalCommentsFutureProvider(userId));
    return generalCommentFuture.when(
      data: (_) {
        if (generalCommentViewModel.result == null ||
            generalCommentViewModel.result!.isEmpty) {
          return const NoDataFoundWidget();
        }
        return ListView.builder(
          itemCount: generalCommentViewModel.result!.length,
          itemBuilder: (context, index) {
            final reversedList =
                generalCommentViewModel.result!.reversed.toList();
            return CommentCard(
                commentModel: reversedList[index],
                onTap: () => GeneralCommentsAlertDialog().show(
                    commentId: reversedList[index].commentId!,
                    context: context,
                    ref: ref,
                    isMyComment: ref
                            .watch(generalCommentsProvider.notifier)
                            .currentUserId ==
                        reversedList[index].createdByUserId));
          },
        );
      },
      error: (error, stackTrace) => const NoDataFoundWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
