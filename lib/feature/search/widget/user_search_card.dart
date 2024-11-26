import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/model/follower_model.dart';
import 'package:findpro/feature/search/view_model/user_search_view_model.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSearchCard extends ConsumerWidget {
  const UserSearchCard(
      {required this.followerModel,
      required this.currentUserId,
      super.key});
  final FollowerModel followerModel;
  final int currentUserId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: PaddingInsets().large,
      child: ListTile(
          onTap: followerModel.userId == currentUserId
              ? () async {
                  ref.read(userSearchProvider.notifier).clearResults();
                  await context.router.pushAndPopUntil(
                    const ProfileRoute(),
                    predicate: (route) => false,
                  );
                }
              : () async {
                  ref.read(userSearchProvider.notifier).clearResults();
                  await context.router.push(
                      UserProfileRoute(userId: followerModel.userId!));
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
              followerModel.fullName ?? LocaleKeys.undefined.tr(),
              style: context.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          trailing: TextButton(
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
