import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/feature/auth/helper/privacy_contract_url_launcher.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigateToRouteText extends StatelessWidget {
  const NavigateToRouteText(
      {required this.text1,
      required this.text2,
      required this.route,
      super.key});

  final String text1;
  final String text2;
  final PageRouteInfo route;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Text(
            LocaleKeys.privacyContractAgree.tr(),
            style: context.textTheme.labelLarge?.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  PrivacyContractUrlLauncher().launchPrivacyPolicy();
                },
                child: Text(
                  LocaleKeys.privacyContract.tr(),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                )),
            TextButton(
                onPressed: () {
                  PrivacyContractUrlLauncher().launchTermsOfUse();
                },
                child: Text(
                  LocaleKeys.termsOfUse.tr(),
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text1,
              style: context.textTheme.headlineSmall
                  ?.copyWith(color: Colors.black),
            ),
            10.horizontalSpace,
            TextButton(
              onPressed: () {
                context.router.pushAndPopUntil(route, predicate: (_) => false);
              },
              child: Text(
                text2,
                style: context.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w900, color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
