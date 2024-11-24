import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
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
          Text(
            LocaleKeys.noUserFound.tr(),
            style: context.textTheme.headlineSmall,
          ),
          30.verticalSpace,
          SizedBox(
            child: Image.asset(
              'assets/icon/search_bg2.png',
              //height: 280,
            ),
          ),
        ],
      ),
    );
  }
}
