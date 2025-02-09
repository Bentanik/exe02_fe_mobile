import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Api {
  Dio api = Dio();
  String? accessToken;

  final _storage = const FlutterSecureStorage();
  Api() {
    api.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if(!options.path.contains('http')) {
            options.path = 'https://exewebapi-a5b8h2hrdhbderhv.southeastasia-01.azurewebsites.net' + options.path;
          }
          options.headers['Authorization'] = 'Bearer $accessToken';
          return handler.next(options);
        },
        onError: (DioError error, handler) async {
          if((error.response?.statusCode == 401 && error.response?.data['message'] == 'Invalaid JWT')){
            if(await _storage.containsKey(key: 'refreshToken')) {
              await refreshToken();
              return handler.resolve(await _retry(error.requestOptions));
            }
          }
          return handler.next(error);
        }
      )
    );
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions){
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options
    );
  }

  Future<void>  refreshToken() async{
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await api.post('https://exewebapi-a5b8h2hrdhbderhv.southeastasia-01.azurewebsites.net//api/auth/v1/refresh-token', data: {'refreshToken':refreshToken});
    if(response.statusCode == 201){
      accessToken = response.data;
    }else{
      accessToken = null;
      _storage.deleteAll();
    }
  }
}