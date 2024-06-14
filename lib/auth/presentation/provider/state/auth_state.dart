import 'package:todo_example/auth/data/model/sig_in_response_model.dart';

class AuthState {
  final bool? _isLoading;
  final String? _error;
  final SiginResponse? _siginModel;

  AuthState({
    bool? isLoading,
    String? error,
    SiginResponse? siginModel,
  })  : _isLoading = isLoading,
        _error = error,
        _siginModel = siginModel;

  bool? get isLoading => _isLoading;
  String? get error => _error;
  SiginResponse? get siginModel => _siginModel;

  AuthState copyWith({
    String? error,
    bool? isLoading,
    SiginResponse? siginModel,
  }) {
    return AuthState(
      error: error ?? _error,
      isLoading: isLoading ?? _isLoading,
      siginModel: siginModel ?? _siginModel,
    );
  }
}
