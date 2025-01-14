import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/router/guard/auth_guard.dart';
import 'package:findpro/common/router/guard/connection_guard.dart';
import 'package:findpro/common/router/guard/country_guard.dart';
import 'package:findpro/common/router/guard/notification_guard.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: MainRoute.page,
      initial: true,
      guards: [
        AuthGuard(),
        ConnectionGuard(),
      ],
      children: [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(page: UserSearchRoute.page),
        AutoRoute(page: MessagesRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: OnboardingRoute.page),
    AutoRoute(page: SearchResultRoute.page),
    AutoRoute(page: SearchInputRoute.page),
    AutoRoute(
      page: LoginRoute.page,
      guards: [
        NotificationGuard(),
        CountryGuard(),
      ],
    ),
    AutoRoute(
      page: RegisterRoute.page,
      guards: [
        NotificationGuard(),
      ],
    ),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: SupportRoute.page),
    AutoRoute(page: SelectCountryRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: NoConnectionRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: AddJobRoute.page),
    AutoRoute(page: JobDetailRoute.page),
    AutoRoute(page: FollowersRoute.page),
    AutoRoute(page: FollowingRoute.page),
    AutoRoute(page: AddJobRoute.page),
    AutoRoute(page: UserProfileRoute.page),
    AutoRoute(page: AddCommentRoute.page),
    AutoRoute(page: ChatRoute.page),
  ];
}
