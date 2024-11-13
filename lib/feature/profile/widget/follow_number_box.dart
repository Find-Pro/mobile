import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/user_profile/widget/user_profile_more_icon_alert.dart';
import 'package:flutter/material.dart';

class FollowNumberBox extends StatelessWidget {
  const FollowNumberBox(
      {required this.followingCount,
      required this.followersCount,
      required this.isGeneralProfile,
      required this.userId,
      required this.fullName,
      super.key});
  final int followingCount;
  final int followersCount;
  final int userId;
  final bool isGeneralProfile;
  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: Text(
                    fullName,
                    style: context.textTheme.headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.router.push(FollowingRoute(
                            isGeneralProfile: isGeneralProfile)),
                        child: Column(
                          children: [
                            Text(
                              followingCount.toString(),
                              style: context.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              LocaleKeys.followers,
                              style: context.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => context.router.push(FollowingRoute(
                            isGeneralProfile: isGeneralProfile)),
                        child: Column(
                          children: [
                            Text(
                              followingCount.toString(),
                              style: context.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              LocaleKeys.following,
                              style: context.textTheme.labelLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: IconButton(
                  onPressed: () {
                    if (isGeneralProfile) {
                    } else {
                      UserProfileMoreIconAlert().show(context, userId);
                    }
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: context.themeData.indicatorColor,
                  )))
        ],
      ),
    );
  }
}
