import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/widget/ad/video_ad.dart';
import 'package:findpro/feature/profile/widget/profile_cover_image.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileAppBar extends ConsumerWidget {
  const UserProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileViewModel = ref.watch(userProfileProvider);
    return SliverAppBar(
      leading: IconButton(
          onPressed: () async {
            if (context.mounted) {
              Navigator.pop(context);
              if (context.mounted) {
                await context.router.pushWidget(const VideoAdView());
              }
            }
          },
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Colors.white,
          )),
      iconTheme: const IconThemeData(color: Colors.white),
      expandedHeight: 80,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: ProfileCoverImage(
          isGeneralProfile: true,
          photoName: userProfileViewModel.user!.coverPicture!,
        ),
      ),
    );
  }
}
