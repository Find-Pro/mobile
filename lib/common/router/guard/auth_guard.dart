import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/router/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final isLoggedIn = CacheManager.instance.getIsLoggedIn();
    final userId = CacheManager.instance.getUserId();
    if (isLoggedIn && userId != 0) {
      resolver.next();
    } else {
      await resolver.redirect(const DemoOrFullVersion());
    }
  }
}
