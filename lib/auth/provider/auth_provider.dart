import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/auth/provider/state/auth_notifier.dart';
import 'package:todo_example/auth/provider/state/auth_state.dart';

final authStateNotifier = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(),
);
