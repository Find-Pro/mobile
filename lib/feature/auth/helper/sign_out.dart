import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/feature/home/view_model/home_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class SignOut {
  SignOut._init();
  static final SignOut _instance = SignOut._init();
  static SignOut get instance => _instance;
  void signOut(BuildContext context, WidgetRef ref) {
    CacheManager.instance.prefs.clear();
    ref.read(homeProvider.notifier).dispose();

    context.router
        .pushAndPopUntil(const LoginRoute(), predicate: (_) => false);
  }
}
