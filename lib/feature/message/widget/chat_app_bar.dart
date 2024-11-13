import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar(
      {required this.onTap,
      required this.fullName,
      required this.photo,
      super.key});
  final VoidCallback onTap;
  final String photo;
  final String fullName;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: context.themeData.indicatorColor,
          )),
      title: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: Image.network(
                CreateImageUrl.instance.photo(photo),
              ).image,
            ),
            30.horizontalSpace,
            Text(
              fullName,
              style: context.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
