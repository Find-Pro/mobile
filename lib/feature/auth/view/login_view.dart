import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/model/request/login_request.dart';
import 'package:findpro/common/widget/custom_circular.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/view_model/login_view_model.dart';
import 'package:findpro/feature/auth/widget/apple_google_row.dart';
import 'package:findpro/feature/auth/widget/auth_app_bar.dart';
import 'package:findpro/feature/auth/widget/auth_button.dart';
import 'package:findpro/feature/auth/widget/navigate_to_route_text.dart';
import 'package:findpro/feature/auth/widget/pw_text_field.dart';
import 'package:findpro/feature/auth/widget/string_text_field.dart';
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
      appBar: const AuthAppBar(
        text: LocaleKeys.login,
      ),
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      body: Padding(
        padding: PaddingInsets().medium,
        child: Column(
          children: [
            40.verticalSpace,
            StringTextField(
              controller: emailCnt,
              hintText: LocaleKeys.email,
              iconData: Icons.mail,
            ),
            40.verticalSpace,
            PwTextField(
              controller: pwCnt,
              hintText: LocaleKeys.password,
            ),
            40.verticalSpace,
            if (loginViewModel.loadingNotifier.value)
              const CustomCircular(),
            AuthButton(
              text: LocaleKeys.login,
              onTap: () async {
                final success = await loginViewModel.login(LoginRequest(
                    email: emailCnt.text, password: pwCnt.text));
                success
                    ? context.router.pushAndPopUntil(const MainRoute(),
                        predicate: (_) => false)
                    : WarningAlert();
              },
            ),
            40.verticalSpace,
            const AppleGoogleRow(),
            40.verticalSpace,
            const NavigateToRouteText(
              text1: LocaleKeys.doNotYouHaveAnAccount,
              text2: LocaleKeys.register,
              route: RegisterRoute(),
            ),
          ],
        ),
      ),
    );
  }
}
