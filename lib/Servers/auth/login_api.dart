import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginApi {
  final Api api;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  LoginApi(this.api);

  Future<void> login({required String idTokenFirebase}) async {
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

        // Lưu accessToken và thông tin người dùng
        api.accessToken = authTokenDTO['accessToken'];
        await _storage.write(key: 'accessToken', value: api.accessToken);
        await _storage.write(key: 'userFullName', value: authUserDTO['fullName']);
        await _storage.write(key: 'userEmail', value: authUserDTO['email']);
        await _storage.write(key: 'userAvatarUrl', value: authUserDTO['avatarUrl']);


        print(await _storage.read(key: 'userEmail'));
      } else {
        // Xử lý các mã trạng thái khác nếu cần
        print('Đăng nhập thất bại với mã trạng thái: ${response.statusCode}');
      }
    } catch (error) {
      print('Lỗi khi gọi API đăng nhập: $error');
      rethrow;
    }
  }
}
