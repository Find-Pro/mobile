import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/const/locale_keys.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/auth_service.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLoginManager {
  Future<void> login(BuildContext context) async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final credentialState = await SignInWithApple.getCredentialState(
          credential.userIdentifier!);
      debugPrint(credentialState.toString());
      if (credentialState == CredentialState.revoked) {
        Future.delayed(Duration.zero, () {
          context.router.pop();
        });
      } else if (credentialState == CredentialState.authorized) {
        final loginResult = await AuthService()
            .loginWithToken(credential.userIdentifier ?? '', 'appleToken');

        if (loginResult!.success) {
          CacheManager.instance.setUserId(loginResult.user!.userId ?? 0);
          CacheManager.instance.setAppleOrGoogle(true);
          await context.router
              .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
        } else {
          final registerResult = await AuthService().registerWithToken(
              credential.userIdentifier ?? '',
              EndPointEnums.registerWithApple);

          if (registerResult!.success) {
            CacheManager.instance
                .setUserId(registerResult.user!.userId ?? 0);
            CacheManager.instance.setAppleOrGoogle(true);
            await context.router.pushAndPopUntil(const MainRoute(),
                predicate: (_) => false);
            debugPrint('Başarılı kayıt: ${registerResult.user}');
          } else {
            WarningAlert().show(context, LocaleKeys.error, false);
          }
        }
      } else if (credentialState == CredentialState.notFound) {
        final registerResult = await AuthService().registerWithToken(
          credential.userIdentifier ?? '',
          EndPointEnums.registerWithApple,
        );

        debugPrint(registerResult!.user.toString());
        if (registerResult.success) {
          CacheManager.instance
              .setUserId(registerResult.user!.userId ?? 0);
          await context.router
              .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
        } else {
          await context.router.pushAndPopUntil(const LoginRoute(),
              predicate: (_) => false);
        }
      } else {
        WarningAlert().show(context, LocaleKeys.error, false);
      }
    } catch (e) {
      debugPrint('IOS register error:$e');
    }
  }
}
