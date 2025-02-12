import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/platform_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/message/model/message_profile_model.dart';
import 'package:findpro/feature/message/widget/chat_more_icon_alert.dart';
import 'package:findpro/feature/profile/helper/create_image_url.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({required this.messageProfileModel, super.key});
  final MessageProfileModel messageProfileModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.grey.shade700,
      leading: IconButton(
        onPressed: () {
          context.router.pop();
        },
        icon: Icon(
          context.platform == PlatformExtension.iOS
              ? Icons.arrow_back_ios
              : Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => context.router.push(
                UserProfileRoute(userId: messageProfileModel.userId)),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: Image.network(
                CreateImageUrl.instance
                    .photo(messageProfileModel.profilePicture),
              ).image,
            ),
          ),
          Text(
            messageProfileModel.fullName ?? LocaleKeys.undefined.tr(),
            style: context.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
          IconButton(
              onPressed: () {
                ChatMoreIconAlert()
                    .show(context, ref, messageProfileModel.userId);
              },
              icon: Icon(
                Icons.more_vert,
                color: context.themeData.indicatorColor,
              ))
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
