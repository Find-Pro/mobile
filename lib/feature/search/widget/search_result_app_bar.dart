import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
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
            await context.router.pushWidget(const VideoAd()).then((value) {
              context.router.pushAndPopUntil(const MainRoute(),
                  predicate: (_) => false);
            });
          },
          icon: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: Colors.white,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight - 10);
}
