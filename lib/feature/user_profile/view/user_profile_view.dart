import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/comment/view/general_comments_view.dart';
import 'package:findpro/feature/profile/view/comment_and_jobs_page_view.dart';
import 'package:findpro/feature/profile/widget/follow_number_box.dart';
import 'package:findpro/feature/profile/widget/profile_cover_image.dart';
import 'package:findpro/feature/profile/widget/profile_profile_picture.dart';
import 'package:findpro/feature/user_profile/view/user_profile_jobs_list_view.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
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
                          userId: userProfileViewModel.user!.userId!,
                          fullName: userProfileViewModel.user!.fullName ??
                              LocaleKeys.undefined,
                          followingCount: userProfileViewModel
                              .user!.followings!.length,
                          followersCount:
                              userProfileViewModel.user!.followers!.length,
                          isGeneralProfile: true,
                        ),
                        Divider(
                          color: context.themeData.indicatorColor,
                          thickness: 0.3,
                        ),
                        CommentAndJobsPageView(
                          commentWidget: GeneralCommentsView(
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
