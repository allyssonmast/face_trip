part of 'routes_imports.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ContactDetailsPageRoute.page, path: DETAILS_CONTACT),
        AutoRoute(page: LoginPageRoute.page, path: LOGIN),
        AutoRoute(page: RegisterPageRoute.page, path: REGISTER_USER),
        AutoRoute(page: TripPageRoute.page, path: TRIP),
        AutoRoute(
          initial: true,
          page: DashboardPageRoute.page,
          path: '/dashboard',
          guards: [AuthGuard()],
          children: [
            RedirectRoute(path: '', redirectTo: HOME),
            AutoRoute(page: HomePageRoute.page, path: HOME),
            AutoRoute(page: SearchContactsRoute.page, path: SEARCH_CONTACT),
            AutoRoute(page: SettingsPageRoute.page, path: SETTINGS),
          ],
        )
      ];
}
