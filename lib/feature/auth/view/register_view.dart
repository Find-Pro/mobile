import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/model/request/register_request.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/view_model/register_view_model.dart';
import 'package:findpro/feature/auth/widget/auth_app_bar.dart';
import 'package:findpro/feature/auth/widget/background_image.dart';
import 'package:findpro/feature/auth/widget/login_register_button.dart';
import 'package:findpro/feature/auth/widget/navigate_to_route_text.dart';
import 'package:findpro/feature/auth/widget/pw_text_field.dart';
import 'package:findpro/feature/auth/widget/register_title_text.dart';
import 'package:findpro/feature/auth/widget/string_text_field.dart';
import 'package:findpro/feature/auth/widget/support_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RegisterView extends ConsumerWidget {
  const RegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fullNameCnt = TextEditingController();
    final emailCnt = TextEditingController();
    final pwCnt = TextEditingController();
    const isMaster = false;
    final registerViewModel = RegisterViewModel();
    return Scaffold(
      appBar: const AuthAppBar(text: LocaleKeys.register),
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: Padding(
              padding: PaddingInsets().small,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const RegisterTitleText(),
                    30.verticalSpace,
                    StringTextField(
                      controller: fullNameCnt,
                      hintText: LocaleKeys.fullName,
                      iconData: Icons.person_outline,
                    ),
                    20.verticalSpace,
                    StringTextField(
                      controller: emailCnt,
                      hintText: LocaleKeys.email,
                      iconData: Icons.mail,
                    ),
                    30.verticalSpace,
                    PwTextField(
                      controller: pwCnt,
                      hintText: LocaleKeys.password,
                    ),
                    30.verticalSpace,
                    if (registerViewModel.loadingNotifier.value)
                      const CircularProgressIndicator(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SupportButton(),
                        LoginRegisterButton(
                          text: LocaleKeys.register,
                          onTap: () async {
                            final success = await ref
                                .read(registerProvider.notifier)
                                .register(RegisterRequest(
                                    password: pwCnt.text,
                                    email: emailCnt.text,
                                    fullName: fullNameCnt.text,
                                    isMaster: isMaster));
                            success
                                ? context.router.pushAndPopUntil(
                                    const MainRoute(),
                                    predicate: (_) => false)
                                : WarningAlert();
                          },
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    const NavigateToRouteText(
                      text1: LocaleKeys.alreadyHaveAnAccount,
                      text2: LocaleKeys.login,
                      route: LoginRoute(),
                    )
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
