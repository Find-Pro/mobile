import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/const/enum/end_point_enums.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleLoginManager {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> login(BuildContext context, WidgetRef ref) async {
    final user = await googleSignIn.signIn();
    if (user != null) {
      final auth = await user.authentication;
      final idToken = auth.idToken;
      final loginResponse = await AuthService.instance
          .loginWithToken(idToken!, EndPointEnums.loginWithGoogle);

      if (loginResponse!.success) {
        debugPrint('kullanıcı giris yaptı:$loginResponse');
        CacheManager.instance.setAppleOrGoogle(true);
        CacheManager.instance.setUserId(loginResponse.user!.userId ?? 0);
        //  await ref.read(notificationProvider.login);
        await context.router
            .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
      } else {
        // hesabı yok token ile kayıt olacak
        CacheManager.instance.setAppleOrGoogle(true);
        //  await ref.read(notificationProvider.login);
        final response = await AuthService.instance.registerWithToken(
          idToken,
          EndPointEnums.registerWithGoogle,
        );
        if (response!.success) {
          debugPrint('kullanıcı başarılı kayıt oldu');
          debugPrint(response.message);
          final loginResponse = await AuthService.instance
              .loginWithToken(idToken, EndPointEnums.loginWithGoogle);

          if (loginResponse!.success) {
            CacheManager.instance.setAppleOrGoogle(true);
            CacheManager.instance
                .setUserId(loginResponse.user!.userId ?? 0);
            //  await ref.read(notificationProvider.login);
            await context.router.pushAndPopUntil(const MainRoute(),
                predicate: (_) => false);
          } else {
            debugPrint('error'.tr());
          }
        } else {
          debugPrint('error'.tr());
        }
      }
    } else {
      debugPrint('error'.tr());
    }
  }

  Future<void> logout() async {
    try {
      await googleSignIn.signOut();
    } catch (error) {
      debugPrint('error'.tr());
    }
  }

  Future<void> deleteAccount() async {
    await googleSignIn.disconnect();
  }
}
