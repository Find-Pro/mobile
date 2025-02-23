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
      debugPrint('Apple Login: Giriş işlemi başlatıldı.');

      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      debugPrint('Apple Login: Kimlik alındı.');
      debugPrint('Apple User Identifier: ${credential.userIdentifier}');
      debugPrint('Apple Email: ${credential.email}');
      debugPrint(
          'Apple Full Name: ${credential.givenName} ${credential.familyName}');

      if (credential.userIdentifier == null) {
        debugPrint('Apple Login: Kullanıcı kimliği NULL döndü!');
        return;
      }

      final credentialState =
          await SignInWithApple.getCredentialState(credential.userIdentifier!);
      debugPrint('Apple Credential State: $credentialState');

      await handleCredentialState(context, ref, credentialState, credential);
    } catch (e) {
      debugPrint('Apple Login Hatası: $e');
    }
  }

  Future<void> handleCredentialState(
    BuildContext context,
    WidgetRef ref,
    CredentialState credentialState,
    AuthorizationCredentialAppleID credential,
  ) async {
    debugPrint('Apple Handle Credential State: $credentialState');

    switch (credentialState) {
      case CredentialState.revoked:
        debugPrint(
            'Apple Login: Kullanıcı yetkisi iptal edilmiş (revoked). Giriş sayfasına yönlendiriliyor.');
        await context.router
            .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);

      case CredentialState.authorized:
        debugPrint('Apple Login: Kullanıcı yetkisi onaylanmış.');
        await handleAuthorizedState(context, ref, credential);

      case CredentialState.notFound:
        debugPrint(
            'Apple Login: Kullanıcı bulunamadı, kayıt işlemi başlatılıyor.');
        await handleNotFoundState(context, ref, credential);
    }
  }

  Future<void> handleAuthorizedState(
    BuildContext context,
    WidgetRef ref,
    AuthorizationCredentialAppleID credential,
  ) async {
    debugPrint('Apple Yetkilendirme: Kullanıcı giriş yapıyor.');
    debugPrint('Apple User Identifier: ${credential.userIdentifier}');

    final loginResult = await AuthService.instance.loginWithToken(
      credential.userIdentifier ?? '',
      EndPointEnums.loginWithApple,
    );

    if (loginResult == null || !loginResult.success) {
      debugPrint(
          'Apple Yetkilendirme: Kullanıcı girişi başarısız, kayıt işlemi başlatılıyor.');
      await handleNotFoundState(context, ref, credential);
      return;
    } else {
      debugPrint(
          'Apple Yetkilendirme: Kullanıcı girişi başarılı, yönlendirme yapılıyor.');
      await saveUserAndNavigate(context, ref, loginResult.user!.userId);

      final registerResult = await AuthService.instance.registerWithToken(
        credential.userIdentifier ?? '',
        credential.userIdentifier ?? '',
        EndPointEnums.registerWithApple,
      );
      if (registerResult != null && registerResult.success) {
        debugPrint('Apple Yetkilendirme: Kullanıcı kaydı başarılı.');
        await saveUserAndNavigate(context, ref, registerResult.user!.userId);
      } else {
        debugPrint('Apple Yetkilendirme: Kullanıcı kaydı başarısız.');
        WarningAlert().show(context, LocaleKeys.error.tr(), false);
      }
    }
  }

  Future<void> handleNotFoundState(
    BuildContext context,
    WidgetRef ref,
    AuthorizationCredentialAppleID credential,
  ) async {
    debugPrint('Apple Kayıt: Kullanıcı bulunamadı, kayıt işlemi başlatılıyor.');

    final registerResult = await AuthService.instance.registerWithToken(
      credential.userIdentifier ?? '',
      '',
      EndPointEnums.registerWithApple,
    );

    debugPrint('Apple Kayıt Sonucu: ${registerResult!.user}');

    if (registerResult.success) {
      debugPrint(
          'Apple Kayıt: Kullanıcı başarıyla kaydedildi, yönlendiriliyor.');
      await saveUserAndNavigate(context, ref, registerResult.user!.userId);
    } else {
      debugPrint(
          'Apple Kayıt: Kullanıcı kaydı başarısız, giriş sayfasına yönlendiriliyor.');
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
    debugPrint('Apple Giriş Başarılı: Kullanıcı kaydediliyor.');
    CacheManager.instance.setUserId(userId ?? 0);
    CacheManager.instance.setIsLoggedIn(true);

    await ref.read(notificationProvider).login();
    debugPrint('Apple Giriş Başarılı: Ana sayfaya yönlendiriliyor.');
    await context.router
        .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
  }
}
