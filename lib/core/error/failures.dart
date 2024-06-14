class AppFailure {
  final String message;
  const AppFailure(this.message);
}

// General failures
class AppServerFailure extends AppFailure {
  AppServerFailure(String message) : super(message);
}

class AppCacheFailure extends AppFailure {
  const AppCacheFailure(String message) : super(message);
}
