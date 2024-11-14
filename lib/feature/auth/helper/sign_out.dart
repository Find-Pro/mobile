import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:flutter/cupertino.dart';

final class SignOut {
  SignOut._init();
  static final SignOut _instance = SignOut._init();
  static SignOut get instance => _instance;
  void signOut(BuildContext context) {
    CacheManager.instance.prefs.clear();
    context.router
        .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
  }
}
