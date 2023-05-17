import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:facetrip/routes/names_routes.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'routes/routes_imports.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    FutureOr<DeepLink> myDeepLinkHandler(PlatformDeepLink deepLink) async {
      if (deepLink.path.startsWith(DETAILS_CONTACT)) {
        return deepLink;
      } else {
        return DeepLink.defaultPath;
      }
    }

    return MaterialApp.router(
      title: 'Face Trip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.greenAccent),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: myDeepLinkHandler,
        navigatorObservers: () => [
          FirebaseAnalyticsObserver(
            analytics: analytics,
          ),
        ],
      ),
    );
  }
}
