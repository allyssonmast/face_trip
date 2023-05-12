import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'core/shered/widget/my_circular_indicator.dart';
import 'modules/home/presentation/page/home_page.dart';
import 'modules/login/presentation/page/login_page.dart';

class MyAppRouterDelegate extends RouterDelegate<RouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouteConfig> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final FirebaseAuth auth = FirebaseAuth.instance;

  MyAppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  Stream<User?> get _authStream => auth.authStateChanges();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: _authStream,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MyCircularIndicator();
        }

        final isAuthenticated = snapshot.hasData;

        if (isAuthenticated) {
          return Navigator(
            key: navigatorKey,
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }

              notifyListeners();
              return true;
            },
            pages: const [
              MaterialPage(
                key:  ValueKey('home'),
                child: HomePage(),
              ),
            ],
          );
        } else {
          return Navigator(
            key: navigatorKey,
            onPopPage: (route, result) {
              if (!route.didPop(result)) {
                return false;
              }

              notifyListeners();
              return true;
            },
            pages: const [
              MaterialPage(
                key:  ValueKey('login'),
                child: LoginPage(),
              ),
            ],
          );
        }
      },
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfig configuration) async {
    // This is not implemented since we don't support routing from the address bar
    return;
  }

  @override
  RouteConfig get currentConfiguration => const RouteConfig();

  @override
  GlobalKey<NavigatorState>? get navigatorKeyvalue => navigatorKey;
}

class RouteConfig {
  const RouteConfig();
}
