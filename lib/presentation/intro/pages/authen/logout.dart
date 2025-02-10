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
        print("Logout thành công");
        return true;
      } else {
        print("Lỗi khi logout: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      print("Lỗi trong quá trình logout: $e");
      return false;
    } finally {
      await _storage.deleteAll();
    }
  }
}
