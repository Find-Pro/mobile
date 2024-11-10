import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/comment_filter_service.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/comment/view_model/general_comments_view_model.dart';
import 'package:findpro/feature/comment/widget/add_comment_text_field.dart';
import 'package:findpro/feature/comment/widget/dialog_add_rating_stars.dart';
import 'package:findpro/feature/comment/widget/submit_commit_button.dart';
import 'package:findpro/feature/profile/widget/profile_profile_picture.dart';
import 'package:findpro/feature/settings/widget/settings_app_bar.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddCommentView extends ConsumerWidget {
  const AddCommentView({required this.userId, super.key});
  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = TextEditingController();
    final ratingNotifier = ValueNotifier(1);
    final userProfileViewModel = ref.watch(userProfileProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const SettingsAppBar(text: LocaleKeys.addComment),
      body: SingleChildScrollView(
        child: Column(
          children: [
            30.verticalSpace,
            ProfileProfilePicture(
              isGeneralProfile: true,
              photoName: userProfileViewModel.user!.profilePicture!,
            ),
            10.verticalSpace,
            Text(
              userProfileViewModel.user!.fullName ?? '',
              style: context.textTheme.labelLarge,
            ),
            30.verticalSpace,
            DialogAddRatingStars(onRatingChanged: (int value) {
              ratingNotifier.value = value;
            }),
            30.verticalSpace,
            AddCommentTextField(
              textController: commentController,
            ),
            30.verticalSpace,
            SubmitCommitButton(onTap: () {
              submitComment(
                  context, ref, userId, commentController, ratingNotifier);
            })
          ],
        ),
      ),
    );
  }

  void showWarning(BuildContext context, String message) {
    WarningAlert().show(context, message, true);
  }

  void showInfoToast(BuildContext context, String message) {
    InformationToast().show(context, message);
  }

  Future<void> submitComment(
      BuildContext context,
      WidgetRef ref,
      int userId,
      TextEditingController commentController,
      ValueNotifier<int> ratingNotifier) async {
    final commentText = commentController.text;
    if (commentText.isEmpty) {
      showWarning(context, LocaleKeys.commentShouldBe10Character);
      return;
    }
    if (CommentFilterService.containsForbiddenWord(commentText)) {
      showWarning(context, LocaleKeys.pleaseAvoidBadWords);
      return;
    }
    final res = await ref
        .read(generalCommentsProvider.notifier)
        .addComment(userId, commentText, ratingNotifier.value);

    if (res) {
      await context.router.pop();
      showInfoToast(context, LocaleKeys.commentCreatedSuccessfully);
    } else {
      showInfoToast(context, LocaleKeys.anErrorOccurred);
    }
  }
}
