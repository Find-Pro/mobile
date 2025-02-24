import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/regex_type.dart';
import 'package:findpro/common/const/extension/context_extension.dart';
import 'package:findpro/common/const/padding_insets.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/manager/notification_manager.dart';
import 'package:findpro/common/services/model/request/register_request.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/feature/auth/view_model/register_view_model.dart';
import 'package:findpro/feature/auth/widget/background_image.dart';
import 'package:findpro/feature/auth/widget/index.dart';
import 'package:findpro/feature/auth/widget/register_title_text.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
    return Scaffold(
      backgroundColor: context.themeData.scaffoldBackgroundColor,
      resizeToAvoidBottomInset: false,
      // ignore: deprecated_member_use
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
                      hintText: LocaleKeys.fullName.tr(),
                      iconData: Icons.person_outline,
                    ),
                    20.verticalSpace,
                    StringTextField(
                      controller: emailCnt,
                      hintText: LocaleKeys.email.tr(),
                      iconData: Icons.mail,
                    ),
                    30.verticalSpace,
                    PwTextField(
                      isRegisterView: true,
                      controller: pwCnt,
                      hintText: LocaleKeys.password.tr(),
                    ),
                    30.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SupportButton(),
                        LoginRegisterButton(
                          text: LocaleKeys.register.tr(),
                          onTap: () => _handleRegister(
                            context,
                            ref,
                            fullNameCnt,
                            emailCnt,
                            pwCnt,
                          ),
                        ),
                      ],
                    ),
                    30.verticalSpace,
                    NavigateToRouteText(
                      text1: LocaleKeys.alreadyHaveAnAccount.tr(),
                      text2: LocaleKeys.login.tr(),
                      route: const LoginRoute(),
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

  Future<void> _handleRegister(
    BuildContext context,
    WidgetRef ref,
    TextEditingController fullNameCnt,
    TextEditingController emailCnt,
    TextEditingController pwCnt,
  ) async {
    if (!RegexType.eMail.regex.hasMatch(emailCnt.text.trim())) {
      WarningAlert().show(
        context,
        'Invalid e-mail format',
        false,
      );
      return;
    }
    final res =
        await ref.read(registerProvider.notifier).register(RegisterRequest(
              password: pwCnt.text,
              email: emailCnt.text,
              fullName: fullNameCnt.text,
            ));

    if (res.success) {
      if (!kIsWeb) {
        await ref.read(notificationProvider).login();
      }

      CacheManager.instance.setUserId(res.user!.userId ?? 0);
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
