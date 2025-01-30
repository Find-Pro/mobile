import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/extension/platform_extension.dart';
import 'package:findpro/common/widget/ad/video_ad.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';

class SearchResultAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchResultAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(5),
        ),
      ),
      backgroundColor: Colors.grey.shade700,
      title: Text(
        LocaleKeys.searchResult.tr(),
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      leading: IconButton(
        onPressed: () async {
          if (context.mounted) {
            await context.router.pop().then((value) {
              if (context.mounted) {
                context.router.pushWidget(const VideoAdView());
              }
            });
          }
        },
        icon: Icon(
          context.platform == PlatformExtension.iOS
              ? Icons.arrow_back_ios
              : Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 10);
}
