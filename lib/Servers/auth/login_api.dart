import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';

class LoginApi {
  final Api api;

  LoginApi(this.api);

  Future<Response<dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.api.post(
        '/api/auth/v1/login',
        data: {
          "email": email,
          "password": password,
        },
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
