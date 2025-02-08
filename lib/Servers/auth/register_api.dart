import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';

class RegisterApi {
  final Api api;

  RegisterApi(this.api);

  Future<Response<dynamic>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.api.post(
        '/api/auth/v1/register',
        data: {
          "email": email,
          "password": password,
          "fullName": name
        },
      );
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
