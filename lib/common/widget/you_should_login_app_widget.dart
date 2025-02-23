import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_future_builder.dart';
import 'package:findpro/feature/home/widget/home_background_image.dart';
import 'package:findpro/feature/search/widget/user_search_no_result_image.dart';
import 'package:findpro/feature/settings/widget/settings_confirm_button.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YouShouldLoginAppWidget extends StatelessWidget {
  const YouShouldLoginAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Future<bool> getIsLoggedIn() async {
      return CacheManager.instance.getUserId() != 0;
    }

    return Scaffold(
        body: CustomFutureBuilder<bool>(
            future: getIsLoggedIn(),
            child: (isLoggedIn) => Stack(
                  children: [
                    const HomeBackgroundImage(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const UserSearchNoResultImage(),
                        Center(
                          child: Text(
                            LocaleKeys.toAccessTheseFeatures.tr(),
                            style: context.textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                        30.verticalSpace,
                        SettingsConfirmButton(
                          text: LocaleKeys.loginRegister.tr(),
                          onTap: () {
                            context.router.pushAndPopUntil(
                              const LoginRoute(),
                              predicate: (_) => false,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                )));
  }
}
