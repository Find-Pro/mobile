import 'package:findpro/feature/profile/helper/change_cover_picture.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/widget/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileCoverImage extends ConsumerWidget {
  const ProfileCoverImage(
      {required this.photoName,
      required this.isGeneralProfile,
      super.key});
  final String photoName;
  final bool isGeneralProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        if (isGeneralProfile) {
          FullScreenImage().show(context, photoName);
        } else {
          ChangeCoverPicture().show(context, ref);
        }
      },
      onLongPress: () {
        if (isGeneralProfile) {
        } else {
          FullScreenImage().show(context, photoName);
        }
      },
      child: SizedBox(
          width: double.infinity,
          height: 160,
          child: Image.network(
            CreateImageUrl.instance.photo(photoName),
            fit: BoxFit.cover,
          )),
    );
  }
}
