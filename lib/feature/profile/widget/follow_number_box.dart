import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:flutter/material.dart';

class FollowNumberBox extends StatelessWidget {
  const FollowNumberBox(
      {required this.followingCount,
      required this.followersCount,
      required this.isGeneralProfile,
      super.key});
  final int followingCount;
  final int followersCount;
  final bool isGeneralProfile;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => context.router
                .push(FollowingRoute(isGeneralProfile: isGeneralProfile)),
            child: Column(
              children: [
                Text(
                  followingCount.toString(),
                  style: context.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  LocaleKeys.followers,
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => context.router
                .push(FollowingRoute(isGeneralProfile: isGeneralProfile)),
            child: Column(
              children: [
                Text(
                  followingCount.toString(),
                  style: context.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  LocaleKeys.following,
                  style: context.textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
