import 'package:findpro/feature/profile/helper/change_cover_picture.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/widget/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileCoverImage extends ConsumerWidget {
  const ProfileCoverImage({required this.photoName, super.key});
  final String photoName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => ChangeCoverPicture().show(context, ref),
      onLongPress: () => FullScreenImage().show(context, photoName),
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
