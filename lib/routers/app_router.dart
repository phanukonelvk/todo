import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_example/auth/screen/auth_screen.dart';
import 'package:todo_example/splash/screen/splash_screen.dart';
import 'package:todo_example/todo/todo_screen.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute { splash, login, home }

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/${AppRoute.splash.name}',
        name: AppRoute.splash.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        path: '/${AppRoute.home.name}',
        name: AppRoute.home.name,
        builder: (context, state) {
          return const TodoScreen();
        },
      ),
      GoRoute(
        path: '/',
        name: AppRoute.login.name,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
    ],
    // redirect: (context, state) {},
  );
});
