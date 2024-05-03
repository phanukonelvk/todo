import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_example/routers/app_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text("Splash Page")),
          ElevatedButton(
              onPressed: () {
                context.goNamed(AppRoute.login.name);
              },
              child: const Text("Lets Login"))
        ],
      ),
    );
  }
}
