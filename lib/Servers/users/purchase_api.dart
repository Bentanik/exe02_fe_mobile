// import 'package:dio/dio.dart';
// import 'package:exe02_fe_mobile/Servers/api.dart';
// import 'package:exe02_fe_mobile/models/users/purchase_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
// class PurchaseVipApi {
//   final Api api;
//   PurchaseVipApi(this.api);
//   FlutterSecureStorage _storage = FlutterSecureStorage();
//
//
//   Future<PaymentResponse> fetchPurchase(String subscriptionPackageId) async {
//     try {
//       var checkAccess = await _storage.read(key: 'accessToken');
//       if (checkAccess == null || checkAccess.isEmpty) {
//         throw Exception("Bạn cần đăng nhập để có thể mua được!");
//       }
//       final response = await api.api.post(
//         '/api/user/v1/purcharse-vip',
//         queryParameters: {"subscriptionPackageId": subscriptionPackageId},
//       );
//
//       var responseData = response.data;
//       return PaymentResponse.fromJson(responseData);
//     } on DioException catch (e) {
//       var errorData = e.response?.data;
//       String errorMessage = errorData?['detail'] ?? "Lỗi không xác định";
//       print("Bắt lỗi trong try-catch:");
//       print("Title: ${errorData?['title']}");
//       print("Status: ${errorData?['status']}");
//       print("Detail: $errorMessage");
//       print("Error Code: ${errorData?['errorCode']}");
//
//       return PaymentResponse(
//         value: Value(
//           code: '',
//           message: '',
//           data: Data(success: false, paymentUrl: '', message: errorMessage),
//         ),
//         isSuccess: false,
//         isFailure: true,
//         error: Error(
//           code: e.response?.statusCode.toString() ?? 'Unknown',
//           message: errorMessage,
//         ),
//       );
//     }catch (error) {
//       return PaymentResponse(
//         value: Value(
//           code: '',
//           message: '',
//           data: Data(success: false, paymentUrl: '', message: error.toString()),
//         ),
//         isSuccess: false,
//         isFailure: true,
//         error: Error(
//           code: 'Unknown',
//           message: error.toString(),
//         ),
//       );
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/ApiResponse/api_exception.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/users/purchase_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PurchaseVipApi {
  final Api api;

  PurchaseVipApi(this.api);

  final FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<ApiResponse<PaymentResponse>> fetchPurchase(
      String subscriptionPackageId) async {
    try {
      final checkAccess = await _storage.read(key: 'accessToken');
      if (checkAccess == null || checkAccess.isEmpty) {
        return ApiResponse(error: "Bạn cần đăng nhập để có thể mua được gói premium!");
      }

      final response = await api.api.post(
        '/api/user/v1/purcharse-vip',
        queryParameters: {"subscriptionPackageId": subscriptionPackageId},
      );

      final responseData = response.data;
      return ApiResponse(data: PaymentResponse.fromJson(responseData));
    } on DioException catch (e) {
      print("error data nè ${e.message}");
      final errorData = e.response?.data;

      final errorMessage = errorData?['detail'] ?? "Lỗi không xác định";

      final responseError = errorMessage.contains(
          "Lỗi không xác định")
          ? "Đã xảy ra lỗi. Vui cần đăng nhập lại!"
          : e.toString();

      return ApiResponse(
        error: responseError,
      );
    } catch (e) {
      final errorMessage = e.toString().contains(
              "type 'String' is not a subtype of type 'int' of 'index'")
          ? "Bạn cần đăng nhập lại!"
          : e.toString();
      return ApiResponse(
        error: errorMessage,
      );
    }
  }
}
