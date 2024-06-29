import 'dart:async';

import 'package:firebase/controllers/auth_controller.dart';
import 'package:firebase/enum/enum.dart';
import 'package:firebase/screeens/auth/login_screen.dart';
import 'package:firebase/screeens/auth/registration_screen.dart';
import 'package:firebase/screeens/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class GlobalRouter {
  static void initialize() {
    GetIt.instance.registerSingleton<GlobalRouter>(GlobalRouter());
  }

  static GlobalRouter get instance => GetIt.instance<GlobalRouter>();

  static GlobalRouter get I => GetIt.instance<GlobalRouter>();

  late GoRouter router;
  late GlobalKey<NavigatorState> _routeNavigatorKey;
  late GlobalKey<NavigatorState> _shellNavigatorKey;

  FutureOr<String?> handleRedirect(
      BuildContext context, GoRouterState state) async {
    if (AuthController.I.state == AuthState.authenticated) {
      if (state.matchedLocation == LoginScreen.route) {
        return HomeScreen.route;
      }
      if (state.matchedLocation == RegistrationScreen.route) {
        return HomeScreen.route;
      }
      return null;
    }
    if (AuthController.I.state != AuthState.authenticated) {
      if (state.matchedLocation == LoginScreen.route) {
        return null;
      }
      if (state.matchedLocation == RegistrationScreen.route) {
        return null;
      }
      return LoginScreen.route;
    }
    return null;
  }

  GlobalRouter() {
    _routeNavigatorKey = GlobalKey<NavigatorState>();
    _shellNavigatorKey = GlobalKey<NavigatorState>();
    router = GoRouter(
      navigatorKey: _routeNavigatorKey,
      initialLocation: HomeScreen.route,
      redirect: handleRedirect,
      refreshListenable: AuthController.I,
      routes: [
        GoRoute(
          parentNavigatorKey: _routeNavigatorKey,
          path: LoginScreen.route,
          name: LoginScreen.name,
          builder: (context, _) {
            return const LoginScreen();
          },
        ),
        GoRoute(
          parentNavigatorKey: _routeNavigatorKey,
          path: RegistrationScreen.route,
          name: RegistrationScreen.name,
          builder: (context, _) {
            return const RegistrationScreen();
          },
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          routes: [
            GoRoute(
              parentNavigatorKey: _shellNavigatorKey,
              path: HomeScreen.route,
              name: HomeScreen.name,
              builder: (context, _) {
                return HomeScreen();
              },
            ),
          ],
          builder: (context, state, child) {
            return HomeScreen();
          },
        ),
      ],
    );
  }
}
