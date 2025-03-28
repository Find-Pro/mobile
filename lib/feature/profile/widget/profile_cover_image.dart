import 'package:cached_network_image/cached_network_image.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
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
    return SizedBox(
        width: double.infinity,
        height: 170,
        child: CachedNetworkImage(
          imageUrl: CreateImageUrl.instance.photo(photoName),
          fit: BoxFit.cover,
        ));
  }
}
