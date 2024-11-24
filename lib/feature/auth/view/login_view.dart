import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/manager/notification_manager.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/view_model/login_view_model.dart';
import 'package:findpro/feature/auth/widget/apple_google_row.dart';
import 'package:findpro/feature/auth/widget/background_image.dart';
import 'package:findpro/feature/auth/widget/login_register_button.dart';
import 'package:findpro/feature/auth/widget/login_welcome_text.dart';
import 'package:findpro/feature/auth/widget/navigate_to_route_text.dart';
import 'package:findpro/feature/auth/widget/pw_text_field.dart';
import 'package:findpro/feature/auth/widget/string_text_field.dart';
import 'package:findpro/feature/auth/widget/support_button.dart';
import 'package:findpro/feature/home/widget/home_app_bar.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LoginView extends ConsumerWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginViewModel = LoginViewModel();
    final emailCnt = TextEditingController();
    final pwCnt = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: HomeAppBar(text: LocaleKeys.login.tr()),
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
                    const LoginWelcomeText(),
                    40.verticalSpace,
                    StringTextField(
                      controller: emailCnt,
                      hintText: LocaleKeys.mailOrPhoneNumber.tr(),
                      iconData: Icons.mail,
                    ),
                    20.verticalSpace,
                    PwTextField(
                      controller: pwCnt,
                      hintText: LocaleKeys.password.tr(),
                    ),
                    40.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SupportButton(),
                        LoginRegisterButton(
                          text: LocaleKeys.login.tr(),
                          onTap: () => _handleLogin(
                            context,
                            ref,
                            loginViewModel,
                            emailCnt,
                            pwCnt,
                          ),
                        ),
                      ],
                    ),
                    40.verticalSpace,
                    const AppleGoogleRow(),
                    40.verticalSpace,
                    NavigateToRouteText(
                      text1: LocaleKeys.doNotYouHaveAnAccount.tr(),
                      text2: LocaleKeys.register.tr(),
                      route: const RegisterRoute(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleLogin(
    BuildContext context,
    WidgetRef ref,
    LoginViewModel loginViewModel,
    TextEditingController emailCnt,
    TextEditingController pwCnt,
  ) async {
    if (pwCnt.text.isEmpty) {
      WarningAlert().show(context, LocaleKeys.warning.tr(), false);
    } else {
      final res = await loginViewModel.login(
        LoginRequest(
          email: emailCnt.text,
          password: pwCnt.text,
        ),
      );
      if (res.success) {
        await ref.read(notificationProvider).login();
        await context.router.pushAndPopUntil(
          const MainRoute(),
          predicate: (_) => false,
        );
      } else {
        WarningAlert().show(
          context,
          res.message ?? LocaleKeys.error.tr(),
          false,
        );
      }
    }
  }
}
