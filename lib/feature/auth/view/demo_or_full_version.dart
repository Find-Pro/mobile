import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/auth/widget/background_image.dart';
import 'package:findpro/feature/auth/widget/index.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:findpro/generated/assets.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class DemoOrFullVersion extends ConsumerWidget {
  const DemoOrFullVersion({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: Padding(
              padding: PaddingInsets().small,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Transform.scale(
                      scale: 0.3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          Assets.iconLauncher,
                        ),
                      ),
                    ),
                    Text(
                      LocaleKeys.welcomeBack.tr(),
                      style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    30.verticalSpace,
                    SettingsConfirmButton(
                        text: LocaleKeys.loginRegister.tr(),
                        onTap: () {
                          context.router.pushAndPopUntil(
                              const LoginRoute(),
                              predicate: (_) => false);
                        }),
                    30.verticalSpace,
                    SettingsConfirmButton(
                        text: LocaleKeys.continueWithoutAccount.tr(),
                        onTap: () {
                          context.router.pushAndPopUntil(const MainRoute(),
                              predicate: (_) => false);
                        }),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SupportButton(),
                      ],
                    ),
                    30.verticalSpace,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
