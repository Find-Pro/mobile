import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/question_alert.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:flutter/material.dart';

class FollowerListTile extends StatelessWidget {
  const FollowerListTile(
      {required this.followerModel,
      required this.currentUserId,
      required this.isFollowersView,
      required this.isGeneralProfile,
      super.key});
  final FollowerModel followerModel;
  final int currentUserId;
  final bool isGeneralProfile;
  final bool isFollowersView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().large,
      child: ListTile(
          onTap: followerModel.userId == currentUserId
              ? () {
                  context.router.pushAndPopUntil(
                    const ProfileRoute(),
                    predicate: (route) => false,
                  );
                }
              : () {
                  context.router.push(const UserProfileRoute());
                },
          leading: CircleAvatar(
              radius: 25,
              backgroundImage: Image.network(
                CreateImageUrl.instance
                    .photo(followerModel.profilePicture!),
              ).image),
          title: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              followerModel.fullName ?? '',
              style: context.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          trailing: isFollowersView
              ? const SizedBox()
              : TextButton(
                  onPressed: () {
                    QuestionAlert().show(context,
                        LocaleKeys.areYouSureDeleteFollower, () {});
                  },
                  child: Text(
                    LocaleKeys.removeFollower,
                    style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.red, fontWeight: FontWeight.w700),
                  ))),
    );
  }
}
