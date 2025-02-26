import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/ApiResponse/api_exception.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/premiums/premium_detail_model.dart';
import 'package:exe02_fe_mobile/models/premiums/premiums_model.dart';

class PremiumApiService {
  final Dio _dio = Api().api;

  Future<ApiResponse<PremiumResponse>> fetchPremiums(String premiumId) async {
    try {
      final response = await _dio.get(
        '/api/subscription/v1/get-subscription-package-by-id',
        queryParameters: {
          'subscriptionPackageId': premiumId,
        },
      );
      if (response.statusCode == 200) {
        print('lấy thông tin premium detail thằng công');
        final data = response.data;
        print('data pre: ${data}');
        if (data.containsKey('value')) {
          return ApiResponse(data: PremiumResponse.fromJson(data['value']));
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
