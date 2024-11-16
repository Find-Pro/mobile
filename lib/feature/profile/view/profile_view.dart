import 'package:auto_route/auto_route.dart' show AutoRouterX, RoutePage;
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/comment/view/my_comments_view.dart';
import 'package:findpro/feature/profile/view/comment_and_jobs_page_view.dart';
import 'package:findpro/feature/profile/view/my_jobs_list_view.dart';
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
    return profileFuture.when(
        data: (_) {
          return GestureDetector(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  ProfileCoverImage(
                    isGeneralProfile: false,
                    photoName: profileViewModel.user!.coverPicture!,
                  ),
                  ProfileProfilePicture(
                    isGeneralProfile: false,
                    photoName: profileViewModel.user!.profilePicture!,
                  ),
                  Column(
                    children: [
                      const FollowNumberBox(isGeneralProfile: false),
                      Divider(
                        color: context.themeData.indicatorColor,
                        thickness: 0.5,
                      ),
                      const CommentAndJobsPageView(
                        commentWidget: MyCommentsView(),
                        jobWidget: MyJobsListView(),
                      )
                    ],
                  )
                ],
              ),
            ),
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! < -500) {
                context.router.push(const SettingsRoute());
              }
            },
          );
        },
        error: (error, stackTrace) => const NoDataFoundWidget(),
        loading: () => const CustomCircular());
  }
}
