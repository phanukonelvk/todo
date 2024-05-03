import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/auth/provider/state/auth_state.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  @override
  AuthNotifier()
      : super(
          AuthState(
            error: null,
            isLoading: false,
            isLoggedIn: false,
          ),
        );

  void signIn() {
    state = state.copyWith(isLoggedIn: true);
  }

  void signOut() {
    state = state.copyWith(isLoggedIn: false);
  }
}
