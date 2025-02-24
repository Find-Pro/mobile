import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/profile/helper/change_profile_picture.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/widget/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileProfilePicture extends ConsumerWidget {
  const ProfileProfilePicture({required this.photoName, super.key});
  final String photoName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 15),
      child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.themeData.splashColor,
          ),
          child: GestureDetector(
            onTap: () {
              ChangeProfilePicture().show(context, ref);
            },
            onLongPress: () {
              FullScreenImage().show(context, photoName);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: context.themeData.splashColor,
              ),
              child: CircleAvatar(
                radius: 55,
                backgroundImage:
                    NetworkImage(CreateImageUrl.instance.photo(photoName)),
              ),
            ),
          )),
    );
  }
}
