import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Api {
  Dio api = Dio();
  String? accessToken;
  final _storage = const FlutterSecureStorage();

  Api() {
    _listenFirebaseTokenChanges();

    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          await _ensureToken();
          if (!options.path.contains('http')) {
            // options.path = 'http://10.0.2.2:5000' + options.path;
            options.path = 'https://exeapi-dscyd2hsacb7ergj.southeastasia-01.azurewebsites.net/' + options.path;
          }
          print('check token');
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          final statusCode = error.response?.statusCode;
          dynamic data = error.response?.data;

          print("🟡 Raw error.response?.data: $data");
          print("🟡 Type of data: ${data.runtimeType}");

          String message = "Lỗi không xác định";

          if (data is Map<String, dynamic>) {
            message = data['detail'] ?? data['message'] ?? message;
          } else if (data is String) {
            message = data;
          }

          print("🟢 Extracted message: $message");

          if (statusCode == 401) {
            if (message == 'Invalid JWT') {
              bool success = await refreshToken();
              if (success) {
                return handler.resolve(await _retry(error.requestOptions));
              }
            }
            return handler.reject(DioError(
              requestOptions: error.requestOptions,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: 401,
                data: {"message": "Bạn cần đăng nhập lại!"},
              ),
            ));
          }

          if (statusCode == 403) {
            return handler.reject(DioError(
              requestOptions: error.requestOptions,
              response: Response(
                requestOptions: error.requestOptions,
                statusCode: 403,
                data: {"message": "Không có quyền"},
              ),
            ));
          }

          if (statusCode == 400 || statusCode == 404) {
            return handler.reject(error);
          }

          return handler.next(error);
        },
      ),
    );
  }

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
        'http://10.0.2.2:5000/api/auth/v1/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.statusCode == 201) {
        final newAccessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        if (newAccessToken != null) {
          accessToken = newAccessToken;
          await _storage.write(key: 'accessToken', value: newAccessToken);
        }
        if (newRefreshToken != null) {
          await _storage.write(key: 'refreshToken', value: newRefreshToken);
        }
        return true;
      } else {
        await _handleTokenExpired();
        return false;
      }
    } catch (e) {
      await _handleTokenExpired();
      return false;
    }
  }

  Future<void> _handleTokenExpired() async {
    accessToken = null;
    await _storage.deleteAll();
  }

  Future<void> updateAccessToken(String newToken) async {
    accessToken = newToken;
    await _storage.write(key: 'accessToken', value: newToken);
  }

  void _listenFirebaseTokenChanges() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      final refreshToken = await _storage.read(key: 'refreshToken');
      if (user != null && refreshToken != null) {
        final newIdToken = await user.getIdToken();
        await updateAccessToken(newIdToken!);
      }
    });
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    accessToken = null;
    await _storage.deleteAll();
  }
}
