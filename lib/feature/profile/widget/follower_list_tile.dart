import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FollowerListTile extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
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
                  context.router.push(
                      UserProfileRoute(userId: followerModel.userId!));
                },
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: CachedNetworkImageProvider(
              CreateImageUrl.instance.photo(followerModel.profilePicture!),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              followerModel.fullName ?? LocaleKeys.undefined.tr(),
              style: context.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          trailing: isFollowersView
              ? const SizedBox()
              : TextButton(
                  onPressed: () {},
                  child: Text(
                    // LocaleKeys.removeFollower.tr(),
                    '',
                    style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.red, fontWeight: FontWeight.w700),
                  ))),
    );
  }
}
