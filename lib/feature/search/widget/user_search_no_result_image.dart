import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/generated/assets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSearchNoResultImage extends StatelessWidget {
  const UserSearchNoResultImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 58),
      child: Column(
        children: [
          if (CacheManager.instance.getIsLoggedIn())
            Text(
              LocaleKeys.noUserFound.tr(),
              style: context.textTheme.headlineSmall,
            ),
          30.verticalSpace,
          Padding(
            padding: PaddingInsets().medium,
            child: SizedBox(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  Assets.iconFeatureGraphic,
                  height: 300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
