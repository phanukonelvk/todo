class AuthState {
  final bool? _isLoading;
  final String? _error;
  final bool? _isLoggedIn;

  AuthState({
    bool? isLoading,
    String? error,
    bool? isLoggedIn,
  })  : _isLoading = isLoading,
        _error = error,
        _isLoggedIn = isLoggedIn;

  bool? get isLoading => _isLoading;
  String? get error => _error;
  bool? get isLoggedIn => _isLoggedIn;

  AuthState copyWith({
    String? error,
    bool? isLoading,
    bool? isLoggedIn,
  }) {
    return AuthState(
      error: error ?? _error,
      isLoading: isLoading ?? _isLoading,
      isLoggedIn: isLoggedIn ?? _isLoggedIn,
    );
  }
}
