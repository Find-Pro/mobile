import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/widget/custom_circular.dart';
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
      return CacheManager.instance.getIsLoggedIn();
    }

    return Scaffold(
      body: FutureBuilder<bool>(
        future: getIsLoggedIn(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const SizedBox();
            case ConnectionState.waiting:
              return const Center(child: CustomCircular());
            case ConnectionState.active:
              return const SizedBox();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }
              return snapshot.hasData
                  ? Stack(
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
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500),
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
                    )
                  : const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
