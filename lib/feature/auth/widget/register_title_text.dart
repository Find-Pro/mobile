import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterTitleText extends StatelessWidget {
  const RegisterTitleText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingInsets().medium,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.createAccount.tr(),
            style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700, color: Colors.black),
          ),
          20.verticalSpace,
          Text(
            LocaleKeys.pleaseEnterYourInfo.tr(),
            style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w300, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
