import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Api {
  Dio api = Dio();
  String? accessToken;
  final _storage = const FlutterSecureStorage();

  Api() {
    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Đảm bảo token mới nhất
          await _ensureToken();
          if (!options.path.contains('http')) {
            options.path = 'http://10.0.2.2:5000' + options.path;
          }
          print('check token');
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          if (error.response?.statusCode == 401 &&
              error.response?.data['message'] == 'Invalid JWT') {
            bool success = await refreshToken();
            if (success) {
              return handler.resolve(await _retry(error.requestOptions));
            }
          }

          if (error.response?.statusCode == 403) {
            print("❌ Không có quyền truy cập");
            return handler.reject(DioError(
              requestOptions: error.requestOptions,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: 403,
                data: {"message": "Không có quyền"},
              ),
            ));
          }

          if(error.response?.statusCode == 400) {
            return handler.reject(error);
          }
          return handler.next(error);
        },
      ),
    );
  }

  /// Đảm bảo `accessToken` luôn được cập nhật trước khi dùng
  Future<void> _ensureToken() async {
    if (accessToken == null) {
      accessToken = await _storage.read(key: 'accessToken');
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    String url = requestOptions.uri.isAbsolute
        ? requestOptions.uri.toString()
        : 'http://10.0.2.2:5000${requestOptions.path}';

    return api.request<dynamic>(
      url,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  Future<bool> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    if (refreshToken == null) {
      return false;
    }

    try {
      final response = await api.post(
        'http://10.0.2.2:5000//api/auth/v1/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      print("🔹 Refresh Token Response: ${response.data}");

      if (response.statusCode == 201) {
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        print("✅ New Access Token: $newAccessToken");
        print("✅ New Refresh Token: $newRefreshToken");

        if (newAccessToken != null) {
          accessToken = newAccessToken;
          await _storage.write(key: 'accessToken', value: newAccessToken);
        }
        if (newRefreshToken != null) {
          await _storage.write(key: 'refreshToken', value: newRefreshToken);
        }
        return true;
      } else {
        print("❌ Refresh failed with response: ${response.data}");
        await _handleTokenExpired();
        return false;
      }
    } catch (e) {
      print("❌ Refresh token error: $e");
      await _handleTokenExpired();
      return false;
    }
  }

  Future<void> _handleTokenExpired() async {
    accessToken = null;
    await _storage.deleteAll();
  }

  /// Cập nhật accessToken sau khi đăng nhập
  Future<void> updateAccessToken(String newToken) async {
    accessToken = newToken;
    await _storage.write(key: 'accessToken', value: newToken);
  }
}

