// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:facetrip/modules/contact_details/presentation/page/contact_details_page.dart'
    as _i1;
import 'package:facetrip/modules/dashboard/presentation/page/dashboard_page.dart'
    as _i2;
import 'package:facetrip/modules/home/presentation/page/home_page.dart' as _i3;
import 'package:facetrip/modules/login/domain/entities/user.dart' as _i10;
import 'package:facetrip/modules/login/presentation/page/login_page.dart'
    as _i4;
import 'package:facetrip/modules/register/presentation/page/register_page.dart'
    as _i5;
import 'package:facetrip/modules/search/presentation/pages/search_contacts_page.dart'
    as _i6;
import 'package:facetrip/modules/settings/presentation/page/settings_page.dart'
    as _i7;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    ContactDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<ContactDetailsPageRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ContactDetailsPage(
          key: args.key,
          userEntity: args.userEntity,
        ),
      );
    },
    DashboardPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    HomePageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    LoginPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    RegisterPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterPage(),
      );
    },
    SearchContactsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SearchContacts(),
      );
    },
    SettingsPageRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ContactDetailsPage]
class ContactDetailsPageRoute
    extends _i8.PageRouteInfo<ContactDetailsPageRouteArgs> {
  ContactDetailsPageRoute({
    _i9.Key? key,
    required _i10.UserEntity userEntity,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          ContactDetailsPageRoute.name,
          args: ContactDetailsPageRouteArgs(
            key: key,
            userEntity: userEntity,
          ),
          initialChildren: children,
        );

  static const String name = 'ContactDetailsPageRoute';

  static const _i8.PageInfo<ContactDetailsPageRouteArgs> page =
      _i8.PageInfo<ContactDetailsPageRouteArgs>(name);
}

class ContactDetailsPageRouteArgs {
  const ContactDetailsPageRouteArgs({
    this.key,
    required this.userEntity,
  });

  final _i9.Key? key;

  final _i10.UserEntity userEntity;

  @override
  String toString() {
    return 'ContactDetailsPageRouteArgs{key: $key, userEntity: $userEntity}';
  }
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardPageRoute extends _i8.PageRouteInfo<void> {
  const DashboardPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePageRoute extends _i8.PageRouteInfo<void> {
  const HomePageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginPageRoute extends _i8.PageRouteInfo<void> {
  const LoginPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterPageRoute extends _i8.PageRouteInfo<void> {
  const RegisterPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RegisterPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SearchContacts]
class SearchContactsRoute extends _i8.PageRouteInfo<void> {
  const SearchContactsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SearchContactsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchContactsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsPageRoute extends _i8.PageRouteInfo<void> {
  const SettingsPageRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SettingsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPageRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
