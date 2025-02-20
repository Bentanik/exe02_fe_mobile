import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/premiums/premiums_model.dart';

class PremiumsApiService {
  final Dio _dio = Api().api;

  Future<PremiumsResponse> fetchPremiums() async {
    try {
      final response = await _dio.get('/api/subscription/v1/get-subscription-packages');
      if (response.statusCode == 200) {
        final data = response.data;
        if (data.containsKey('value')) {
          return PremiumsResponse.fromJson(data['value']);
        } else {
          throw Exception("Dữ liệu không có key 'value'");
        }
      } else {
        throw Exception("Lỗi khi lấy dữ liệu");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }

}
