import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/auth/domain/domain_module.dart';
import 'package:todo_example/auth/presentation/provider/state/auth_notifier.dart';
import 'package:todo_example/auth/presentation/provider/state/auth_state.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/provider/user_cache_provider.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/repositories/user_cache_repository.dart';

final authStateNotifier = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) {
    final UserCacheRepository userRepository =
        ref.watch(userLocalRepositoryProvider);
    return AuthNotifier(
      authRepo: ref.watch(authRepoProvider),
      userRepository: userRepository,
    );
  },
);
