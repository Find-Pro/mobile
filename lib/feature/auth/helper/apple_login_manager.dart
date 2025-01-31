import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/manager/notification_manager.dart';
import 'package:findpro/common/services/routes/auth_service.dart';
import 'package:findpro/common/widget/warning_alert.dart';
import 'package:findpro/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLoginManager {
  Future<void> login(BuildContext context, WidgetRef ref) async {
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

      await handleCredentialState(
          context, ref, credentialState, credential);
    } catch (e) {
      debugPrint('IOS register error: $e');
    }
  }

  Future<void> handleCredentialState(
    BuildContext context,
    WidgetRef ref,
    CredentialState credentialState,
    AuthorizationCredentialAppleID credential,
  ) async {
    switch (credentialState) {
      case CredentialState.revoked:
        await context.router.pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
        case CredentialState.authorized:
        await handleAuthorizedState(context, ref, credential);
      case CredentialState.notFound:
        await handleNotFoundState(context, ref, credential);
    }
  }

  Future<void> handleAuthorizedState(
      BuildContext context,
      WidgetRef ref,
      AuthorizationCredentialAppleID credential,
      ) async {

    final loginResult = await AuthService.instance.loginWithToken(
      credential.userIdentifier ?? '',
      EndPointEnums.loginWithApple,
    );

    if (loginResult == null || !loginResult.success) {
      await handleNotFoundState(context, ref, credential);
      return;
    } else {
      await saveUserAndNavigate(context, ref, loginResult.user!.userId);

      final registerResult = await AuthService.instance.registerWithToken(
        credential.userIdentifier ?? '',
        credential.userIdentifier ?? '',
        EndPointEnums.registerWithApple,
      );
      if (registerResult != null && registerResult.success) {
        await saveUserAndNavigate(
            context, ref, registerResult.user!.userId);
      } else {
        WarningAlert().show(context, LocaleKeys.error.tr(), false);
      }
    }
  }



  Future<void> handleNotFoundState(
    BuildContext context,
    WidgetRef ref,
    AuthorizationCredentialAppleID credential,
  ) async {
    final registerResult = await AuthService.instance.registerWithToken(
      credential.userIdentifier ?? '',
      '',
      EndPointEnums.registerWithApple,
    );
    debugPrint(registerResult!.user.toString());

    if (registerResult.success) {
      await saveUserAndNavigate(context, ref, registerResult.user!.userId);
    } else {
      await context.router.pushAndPopUntil(
        const LoginRoute(),
        predicate: (_) => false,
      );
    }
  }

  Future<void> saveUserAndNavigate(
    BuildContext context,
    WidgetRef ref,
    int? userId,
  ) async {
    CacheManager.instance.setUserId(userId ?? 0);
    CacheManager.instance.setIsLoggedIn(true);
    await ref.read(notificationProvider).login();
    await context.router
        .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
  }
}
