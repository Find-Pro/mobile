import 'package:auto_route/auto_route.dart' show AutoRouterX, RoutePage;
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/information_toast.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:findpro/feature/profile/widget/profile_cover_image.dart';
import 'package:findpro/feature/profile/widget/profile_profile_picture.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class UserProfileView extends ConsumerWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileViewModel = ref.watch(userProfileProvider);
    final userProfileFuture = ref.watch(userProfileFutureProvider);
    return userProfileFuture.when(
        data: (_) {
          return GestureDetector(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  ProfileCoverImage(
                    photoName: userProfileViewModel.user!.coverPicture!,
                  ),
                  ProfileProfilePicture(
                    photoName: userProfileViewModel.user!.profilePicture!,
                  ),
                  TextButton(
                      onPressed: () {
                        InformationToast().show(context, 'TEXT');
                      },
                      child: const Text('sasdklajsdkl'))
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
        error: (error, stackTrace) => const NoConnectionWidget(),
        loading: () => const CustomCircular());
  }
}
