import 'package:auto_route/auto_route.dart' show AutoRouterX, RoutePage;
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_data_widget.dart';
import 'package:findpro/common/widget/you_should_login_app_widget.dart';
import 'package:findpro/feature/profile/view/profile_body.dart';
import 'package:findpro/feature/profile/view_model/profile_view_model.dart';
import 'package:findpro/feature/profile/widget/follow_number_box.dart';
import 'package:findpro/feature/profile/widget/profile_cover_image.dart';
import 'package:findpro/feature/profile/widget/profile_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileViewModel = ref.watch(profileProvider);
    final profileFuture = ref.watch(profileFutureProvider);
    if (CacheManager.instance.getUserId() == 0) {
      return const YouShouldLoginAppWidget();
    }
    return profileFuture.when(
        data: (_) {
          return GestureDetector(
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: Stack(
                          children: [
                            ProfileCoverImage(
                              isGeneralProfile: false,
                              photoName:
                                  profileViewModel.user!.coverPicture!,
                            ),
                            ProfileProfilePicture(
                              photoName:
                                  profileViewModel.user!.profilePicture!,
                            ),
                            Column(
                              children: [
                                FollowNumberBox(
                                  userId: profileViewModel.user!.userId!,
                                  fullName:
                                      profileViewModel.user!.fullName ??
                                          '',
                                  isGeneralProfile: false,
                                ),
                                Divider(
                                  color: context.themeData.indicatorColor,
                                  thickness: 0.5,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                body: const ProfileBody()),
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < -500) {
                context.router.pushAndPopUntil(const SettingsRoute(),
                    predicate: (_) => false);
              }
            },
          );
        },
        error: (error, stackTrace) => const NoDataWidget(),
        loading: () => const CustomCircular());
  }
}
