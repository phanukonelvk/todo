import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_example/auth/presentation/screen/auth_screen.dart';
import 'package:todo_example/core/shared/localexaple/loacal_data.dart';
import 'package:todo_example/root_page.dart';
import 'package:todo_example/splash/screen/splash_screen.dart';
import 'package:todo_example/product/presentation/screen/product.dart';
import 'package:todo_example/todo/todo_screen.dart';

final _key = GlobalKey<NavigatorState>();

enum AppRoute { splash, login, home, root }

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/${AppRoute.login.name}',
        name: AppRoute.login.name,
        builder: (context, state) {
          return const LoginScreen();
        },
      ),
      GoRoute(
        path: '/${AppRoute.home.name}',
        name: AppRoute.home.name,
        builder: (context, state) {
          return const ProductScreen();
        },
      ),
      GoRoute(
        path: '/',
        name: AppRoute.root.name,
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
    ],
    // redirect: (context, state) async {
    //   bool isLoggedIn = await LocalData.isLoggedIn();
    //   if (state.uri.toString() == '/' && isLoggedIn) {
    //     return '/${AppRoute.home.name}';
    //   }
    //   return null;
    // },
  );
});
