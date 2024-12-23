import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/cache/cache_manager.dart';
import 'package:findpro/common/router/app_router.gr.dart';

class CountryGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final currentCountry = CacheManager.instance.getCountry();
    if (currentCountry != null) {
      resolver.next();
    } else {
      await resolver.redirect(SelectCountryRoute(isSettingsView: false));
    }
  }
}
