import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogoutController {
  final Api api = Api();
  final _storage = const FlutterSecureStorage();

  Future<bool> logout() async {
    try {
      Response response = await api.api.post('/api/auth/v1/logout');

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    } finally {
      String? token = await _storage.read(key: 'accessToken');

      await _storage.deleteAll();

      String? tokenAfter = await _storage.read(key: 'accessToken');
    }
  }
}
