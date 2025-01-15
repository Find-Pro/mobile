import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/profile/view_model/follow_number_box_view_model.dart';
import 'package:findpro/feature/user_profile/widget/user_profile_more_icon_alert.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FollowNumberBox extends ConsumerWidget {
  const FollowNumberBox(
      {required this.isGeneralProfile,
      required this.userId,
      required this.fullName,
      super.key});
  final bool isGeneralProfile;
  final int userId;
  final String fullName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followFuture = ref.watch(followNumberBoxFutureProvider(userId));
    final followNumberBoxViewModel = ref.watch(followNumberBoxProvider);

    return followFuture.when(
      data: (_) {
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
                        fullName,
                        style: context.textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.router.push(
                                FollowingRoute(
                                    userId: userId,
                                    isGeneralProfile: isGeneralProfile)),
                            child: Column(
                              children: [
                                Text(
                                  followNumberBoxViewModel.followingCount
                                      .toString(),
                                  style: context.textTheme.headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  LocaleKeys.following.tr(),
                                  style: context.textTheme.labelLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => context.router.push(
                                FollowersRoute(
                                    userId: userId,
                                    isGeneralProfile: isGeneralProfile)),
                            child: Column(
                              children: [
                                Text(
                                  followNumberBoxViewModel.followersCount
                                      .toString(),
                                  style: context.textTheme.headlineSmall
                                      ?.copyWith(
                                          fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  LocaleKeys.followers.tr(),
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
                              .show(context, ref, userId);
                        },
                        icon: Icon(
                          Icons.more_vert,
                          color: context.themeData.indicatorColor,
                        )))
            ],
          ),
        );
      },
      error: (error, stackTrace) => NoDataWidget(
        text: LocaleKeys.noDataFound.tr(),
      ),
      loading: () => const CustomCircular(),
    );
  }
}
