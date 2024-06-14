import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioError error) {
    print("DioExceptions.fromDioError ${error.type}");
    switch (error.type) {
      case DioErrorType.cancel:
        message = "Request was cancelled";
        statusCode = 499;
        break;
      case DioErrorType.connectionTimeout:
        message = "Connection timeout";
        statusCode = 408;
        break;
      case DioErrorType.sendTimeout:
        message = "Request timeout";
        statusCode = 408;
        break;
      case DioErrorType.receiveTimeout:
        message = "Response timeout";
        statusCode = 408;
        break;
      case DioErrorType.badResponse:
        // api error
        var apiErrorMsg = error.response!.data['error'];
        message = apiErrorMsg ?? error.message!;
        statusCode = error.response!.statusCode!;
        break;
      case DioErrorType.unknown:
        message = "Unexpected error occurred";
        statusCode = error.response!.statusCode!;
        break;
      case DioErrorType.badCertificate:
        message = "Bad certificate";
        statusCode = error.response!.statusCode!;
        break;
      case DioErrorType.connectionError:
        message = "Connection error";
        statusCode = error.response!.statusCode!;
        break;
      default:
        message = "Unexpected error occurred";
        statusCode = 999;
        break;
    }
  }

  late String message;
  late int statusCode;

  @override
  String toString() => message;

  int toInt() => statusCode;
}
