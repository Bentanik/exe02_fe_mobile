import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/users/purchase_model.dart';

class PurchaseVipApi {
  final Api api;
  PurchaseVipApi(this.api);

  Future<PaymentResponse> fetchPurchase(String subscriptionPackageId) async {
    try {
      final response = await api.api.post(
        '/api/user/v1/purcharse-vip',
        queryParameters: {"subscriptionPackageId": subscriptionPackageId},
      );
      return PaymentResponse.fromJson(response.data);
    } catch (error) {
      rethrow;
    }
  }
}
