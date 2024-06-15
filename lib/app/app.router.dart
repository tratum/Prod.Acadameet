// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:stacked/stacked.dart' as _i5;
import 'package:stacked_services/stacked_services.dart' as _i4;

import '../ui/views/dashboard/dashboard_view.dart' as _i2;
import '../ui/views/login/login_view.dart' as _i7;
import '../ui/views/startup/startup_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i3;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i4.StackedService.navigatorKey);

class StackedRouterWeb extends _i5.RootStackRouter {
  StackedRouterWeb({_i6.GlobalKey<_i6.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.StartupView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginViewRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    DashboardViewRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          StartupViewRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
            LoginViewRoute.name,
            path: '/login',
        ),
        _i5.RouteConfig(
          DashboardViewRoute.name,
          path: '/dashboard',
        ),
        _i5.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i5.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.StartupView]
class StartupViewRoute extends _i5.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i2.DashboardView]
class DashboardViewRoute extends _i5.PageRouteInfo<void> {
  const DashboardViewRoute()
      : super(
          DashboardViewRoute.name,
          path: '/dashboard',
        );

  static const String name = 'DashboardView';
}

class LoginViewRoute extends _i5.PageRouteInfo<void> {
  const LoginViewRoute() : super(
      LoginViewRoute.name,
      path: '/login',
  );

  static const String name = 'LoginView';
}

/// generated route for
/// [_i3.UnknownView]
class UnknownViewRoute extends _i5.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i4.RouterService {
  Future<dynamic> navigateToStartupView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToLoginView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToDashboardView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithStartupView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const StartupViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithLoginView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const LoginViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithDashboardView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const DashboardViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i5.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
