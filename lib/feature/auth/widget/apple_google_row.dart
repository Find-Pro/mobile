import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/auth/helper/apple_login_manager.dart';
import 'package:findpro/feature/auth/helper/google_login_manager.dart';
import 'package:findpro/generated/assets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppleGoogleRow extends ConsumerWidget {
  const AppleGoogleRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: SizedBox(
            width: constraints.maxWidth - 70,
            height: 50,
            child: ElevatedButton(
              onPressed: Platform.isAndroid
                  ? () => GoogleLoginManager().login(context, ref)
                  : () => AppleLoginManager().login(context, ref),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.themeData.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Platform.isAndroid
                        ? Assets.iconGooglelogo
                        : Assets.iconApplelogo,
                    height: 40,
                  ),
                  20.horizontalSpace,
                  Text(
                    Platform.isAndroid
                        ? LocaleKeys.loginWithGoogle.tr()
                        : LocaleKeys.loginWithApple.tr(),
                    style: context.textTheme.headlineSmall?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
