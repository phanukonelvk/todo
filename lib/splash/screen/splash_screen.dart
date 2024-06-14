import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_example/product/presentation/screen/product.dart';
import 'package:todo_example/routers/app_router.dart';
import 'package:todo_example/splash/provider/splash_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      final isUserLoggedIn = await ref.read(userLoginCheckProvider.future);
      if (!isUserLoggedIn) {
        // GoRouter.o.go(context.namedLocation("sign_in_page"));
        // ignore: use_build_context_synchronously
        GoRouter.of(context).goNamed(AppRoute.login.name);
      }
    });
    //
    //
  }

  @override
  Widget build(BuildContext context) {
    final bodies = [
      const ProductScreen(),
      // const Center(
      //   child: Text('Hello From Settings'),
      // ),
      const Center(
        child: Text('Hello From Settings'),
      ),
    ];
    final indexBottomNavbar = ref.watch(indexBottomNavbarProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavbar,
        onTap: (value) {
          ref.read(indexBottomNavbarProvider.notifier).update((state) => value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore_rounded), label: 'Explore'),
          // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
      ),
      body: bodies[indexBottomNavbar],
    );
  }
}
