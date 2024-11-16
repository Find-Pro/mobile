import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:findpro/feature/user_profile/widget/user_profile_more_icon_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FollowNumberBox extends ConsumerWidget {
  const FollowNumberBox({required this.isGeneralProfile, super.key});
  final bool isGeneralProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userViewModel = ref
        .watch(isGeneralProfile ? userProfileProvider : profileProvider);
    return Padding(
      padding: EdgeInsets.only(top: isGeneralProfile ? 120 : 170),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: isGeneralProfile ? 35 : 0),
                  child: Text(
                    userViewModel.user!.fullName ?? '',
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
                              userViewModel.user!.followings?.length
                                      .toString() ??
                                  '0',
                              style: context.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'following'.tr(),
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
                              userViewModel.user!.followers?.length
                                      .toString() ??
                                  '0',
                              style: context.textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'followers'.tr(),
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
          if (isGeneralProfile)
            Expanded(
                child: IconButton(
                    onPressed: () {
                      UserProfileMoreIconAlert()
                          .show(context, userViewModel.user!.userId!);
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
