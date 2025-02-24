import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginApi {
  final Api api;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  LoginApi(this.api);

  Future<bool> login({required String idTokenFirebase}) async {
    try {
      final response = await api.api.post(
        '/api/auth/v1/login',
        data: {
          "idTokenFirebase": idTokenFirebase,
        },
      );

      if (response.statusCode == 200) {
        final authTokenDTO = response.data['authTokenDTO'];
        final authUserDTO = response.data['authUserDTO'];

        final newAccessToken = authTokenDTO['accessToken'];

        // ✅ Cập nhật token ngay lập tức vào Api class
        await api.updateAccessToken(newAccessToken);

        // Lưu thông tin vào storage
        await _storage.write(key: 'accessToken', value: authTokenDTO['accessToken']);
        await _storage.write(key: 'refreshToken', value: authTokenDTO['refreshToken']);
        await _storage.write(key: 'userFullName', value: authUserDTO['fullName']);
        await _storage.write(key: 'userEmail', value: authUserDTO['email']);
        await _storage.write(key: 'userAvatarUrl', value: authUserDTO['avatarUrl']);


        return true;
      } else {
        print('❌ Đăng nhập thất bại. Mã trạng thái: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('❌ Lỗi khi gọi API đăng nhập: $error');
      return false;
    }
  }
}
