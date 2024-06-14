// auth_service.dart
import 'package:dio/dio.dart';

class AuthService {
  final String loginUrl = 'https://dummyjson.com/auth/login';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        loginUrl,
        options: Options(
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        ),
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to log in');
      }
    } catch (e) {
      rethrow;
    }
  }
}
