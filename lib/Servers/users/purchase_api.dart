import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/ApiResponse/api_exception.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/users/purchase_model.dart';

class PurchaseVipApi {
  final Api api;

  PurchaseVipApi(this.api);
  Future<ApiResponse<PaymentResponse>> fetchPurchase({
    required String price,
    String? description,
  }) async {
    try {
      // Tạo JSON body
      final data = <String, dynamic>{
        'price': int.tryParse(price) ?? 0,
        'description': description ?? '',
      };

      // Gửi POST với body là JSON
      final response = await api.api.post(
        '/api/donate/v1/donate',
        data: data,
      );

      final responseData = response.data;
      return ApiResponse(data: PaymentResponse.fromJson(responseData));
    } on DioException catch (e) {
      print("Error: ${e.message}");
      final errorData = e.response?.data;
      final errorMessage = errorData?['detail'] ?? "Lỗi không xác định";
      final responseError = errorMessage.contains("Lỗi không xác định")
          ? "Đã xảy ra lỗi. Vui lòng thử lại!"
          : e.toString();
      return ApiResponse(
        error: responseError,
      );
    } catch (e) {
      return ApiResponse(
        error: e.toString(),
      );
    }
  }
}
