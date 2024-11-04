import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/model/request/register_request.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/view_model/register_view_model.dart';
import 'package:findpro/feature/auth/widget/auth_app_bar.dart';
import 'package:findpro/feature/auth/widget/auth_button.dart';
import 'package:findpro/feature/auth/widget/navigate_to_route_text.dart';
import 'package:findpro/feature/auth/widget/pw_text_field.dart';
import 'package:findpro/feature/auth/widget/string_text_field.dart';
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
      body: Padding(
        padding: PaddingInsets().medium,
        child: Column(
          children: [
            30.verticalSpace,
            StringTextField(
              controller: fullNameCnt,
              hintText: LocaleKeys.fullName,
              iconData: Icons.person_outline,
            ),
            30.verticalSpace,
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
            AuthButton(
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
                    ? context.router.pushAndPopUntil(const MainRoute(),
                        predicate: (_) => false)
                    : WarningAlert();
              },
            ),
            30.verticalSpace,
            const NavigateToRouteText(
              text1: LocaleKeys.alreadyHaveAnAccount,
              text2: LocaleKeys.login,
              route: RegisterRoute(),
            )
          ],
        ),
      ),
    );
  }
}
