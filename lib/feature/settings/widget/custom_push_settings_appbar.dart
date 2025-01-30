import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/platform_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class CustomPushSettingsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomPushSettingsAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          context.router.pushAndPopUntil(const ProfileRoute(),
              predicate: (_) => false);
        },
        icon: Icon(
          context.platform == PlatformExtension.iOS
              ? Icons.arrow_back_ios
              : Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: Text(
        LocaleKeys.settings.tr(),
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.grey.shade700,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);
}
