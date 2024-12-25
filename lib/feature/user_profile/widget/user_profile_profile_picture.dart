import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/jobs/helper/get_country_flag.dart';
import 'package:findpro/feature/jobs/helper/get_country_string_from_code.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/feature/profile/widget/full_screen_image.dart';
import 'package:findpro/feature/user_profile/view_model/user_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfileProfilePicture extends ConsumerWidget {
  const UserProfileProfilePicture({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfileVM = ref.watch(userProfileProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.themeData.splashColor,
            ),
            child: GestureDetector(
              onTap: () {
                FullScreenImage()
                    .show(context, userProfileVM.user!.profilePicture!);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.themeData.splashColor,
                ),
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: Image.network(
                    CreateImageUrl.instance
                        .photo(userProfileVM.user!.profilePicture!),
                  ).image,
                ),
              ),
            )),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10),
              child: SvgPicture.asset(
                GetCountryFlag().getSvgPath(userProfileVM.user!.country!),
                height: 40,
              ),
            ),
            20.horizontalSpace,
            Text(
              GetCountryStringFromCode().get(userProfileVM.user!.country!),
              style: context.textTheme.labelLarge
                  ?.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ],
    );
  }
}
