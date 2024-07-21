import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_example/auth/data/model/sig_in_model.dart';
import 'package:todo_example/auth/domain/repositories/auth_repo.dart';
import 'package:todo_example/auth/presentation/provider/state/auth_state.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/repositories/user_cache_repository.dart';
import 'package:todo_example/routers/app_router.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepo? _authRepo;
  final UserCacheRepository? _userRepository;

  @override
  AuthNotifier({AuthRepo? authRepo, UserCacheRepository? userRepository})
      : _authRepo = authRepo!,
        _userRepository = userRepository,
        super(AuthState(
          error: null,
          isLoading: false,
          siginModel: null,
        ));

  Future<void> logIn(
      {String? username, String? password, BuildContext? context}) async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      siginModel: null,
    );
    SiginRequest response =
        SiginRequest(username: username!, password: password!);
    var result = await _authRepo!.siginRepo(request: response);
    result.fold(
      (l) {
        debugPrint('error: ${l.message}');
        state = state.copyWith(
          error: l.message,
          isLoading: false,
          siginModel: null,
        );
      },
      (r) async {
        // log('message Data : ${jsonDecode(r.toString())}');
        state = state.copyWith(
          isLoading: false,
          error: null,
          siginModel: r,
        );
        context!.goNamed(AppRoute.home.name);
      },
    );
  }
}
