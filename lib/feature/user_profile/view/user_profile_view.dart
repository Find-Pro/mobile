import 'package:auto_route/auto_route.dart' show AutoRouterX, RoutePage;
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/ad/video_ad.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/profile/widget/follow_number_box.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:findpro/feature/user_profile/widget/is_following_button.dart';
import 'package:findpro/feature/user_profile/widget/user_profile_app_bar.dart';
import 'package:findpro/feature/user_profile/widget/user_profile_body.dart';
import 'package:findpro/feature/user_profile/widget/user_profile_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UserProfileView extends ConsumerWidget {
  const UserProfileView({required this.userId, super.key});

  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileViewModel = ref.watch(userProfileProvider);
    final userProfileFuture = ref.watch(userProfileFutureProvider(userId));
    ref.read(profileProvider.notifier).getUser();
    return userProfileFuture.when(
      data: (_) {
        if (userProfileViewModel.user == null) {
          return const NoDataWidget();
        }
        return Scaffold(
          // ignore: deprecated_member_use
          body: WillPopScope(
            onWillPop: () async {
              await context.router.pop();
              await context.router.pushWidget(const VideoAdView());
              return false;
            },
            child: CustomScrollView(
              slivers: [
                const UserProfileAppBar(),
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      const UserProfileProfilePicture(),
                      Column(
                        children: [
                          FollowNumberBox(
                            isGeneralProfile: true,
                            userId: userProfileViewModel.user!.userId!,
                            fullName:
                                userProfileViewModel.user!.fullName ?? '',
                          ),
                          IsFollowingButton(userId: userId),
                          Divider(
                            color: context.themeData.indicatorColor,
                            thickness: 0.7,
                          ),
                          const UserProfileBody(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => const NoDataWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
