import 'dart:io';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/feature/auth/helper/apple_login_manager.dart';
import 'package:findpro/feature/auth/helper/google_login_manager.dart';
import 'package:findpro/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppleGoogleRow extends StatelessWidget {
  const AppleGoogleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Center(
          child: SizedBox(
            width: constraints.maxWidth - 70,
            height: 50,
            child: ElevatedButton(
              onPressed: Platform.isAndroid
                  ? () => GoogleLoginManager().login(context)
                  : () => AppleLoginManager().login(context),
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
                        ? LocaleKeys.loginWithGoogle
                        : LocaleKeys.loginWithApple,
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
