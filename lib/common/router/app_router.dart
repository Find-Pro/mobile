import 'package:auto_route/auto_route.dart';
import 'package:findpro/common/router/app_router.gr.dart';
import 'package:findpro/common/router/auth_guard.dart';

@AutoRouterConfig(
  replaceInRouteName: 'View,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: OnboardingRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: MainRoute.page,
      guards: [
        AuthGuard(),
      ],
      children: [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(page: SearchInputRoute.page),
        AutoRoute(page: MessagesRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: SearchResultRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: ChangePasswordRoute.page),
    AutoRoute(page: EditProfileRoute.page),
    AutoRoute(page: ThemeSettingsRoute.page),
    AutoRoute(page: AddJobRoute.page),
    AutoRoute(page: JobDetailRoute.page),
    AutoRoute(page: FollowersRoute.page),
    AutoRoute(page: FollowingRoute.page),
    AutoRoute(page: AddJobRoute.page),
    AutoRoute(page: UserProfileRoute.page),
    AutoRoute(page: AddCommentRoute.page),
  ];
}
