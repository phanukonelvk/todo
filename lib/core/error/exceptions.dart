abstract class AppException {
  
  String message;
  AppException(this.message);

}

class AppServerException extends AppException implements Exception {
  AppServerException(String message) : super(message);
}

class AppCacheException extends AppException implements Exception {
  AppCacheException(String message) : super(message);
}
