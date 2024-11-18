import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/comment/view/user_profile_comments_view.dart';
import 'package:findpro/feature/profile/view/comment_and_jobs_page_view.dart';
import 'package:findpro/feature/profile/widget/follow_number_box.dart';
import 'package:findpro/feature/profile/widget/profile_cover_image.dart';
import 'package:findpro/feature/profile/widget/profile_profile_picture.dart';
import 'package:findpro/feature/user_profile/view/user_profile_jobs_list_view.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:findpro/feature/user_profile/widget/is_following_button.dart';
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
    return userProfileFuture.when(
      data: (_) {
        if (userProfileViewModel.user == null) {
          return const NoDataFoundWidget();
        }
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                expandedHeight: 80,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: ProfileCoverImage(
                    isGeneralProfile: true,
                    photoName: userProfileViewModel.user!.coverPicture!,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    ProfileProfilePicture(
                      isGeneralProfile: true,
                      photoName:
                          userProfileViewModel.user!.profilePicture!,
                    ),
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
                        CommentAndJobsPageView(
                          commentWidget: UserProfileCommentsView(
                            userId: userProfileViewModel.user!.userId!,
                          ),
                          jobWidget: UserProfileJobsListView(
                            userId: userProfileViewModel.user!.userId!,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const NoDataFoundWidget(),
      loading: () => const CustomCircular(),
    );
  }
}
