import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/Servers/premiums/premium_detail_api.dart';
import 'package:exe02_fe_mobile/Servers/users/purchase_api.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/models/premiums/premium_detail_model.dart';
import 'package:exe02_fe_mobile/models/users/purchase_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethods extends StatefulWidget {
  final String premiumId;

  PaymentMethods({required this.premiumId});

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  late Future<PremiumResponse> _premiumFuture;
  final PremiumApiService _apiService = PremiumApiService();
  final PurchaseVipApi _purchaseVipApi = PurchaseVipApi(Api());

  @override
  void initState() {
    super.initState();
    _premiumFuture = _apiService.fetchPremiums(widget.premiumId);
  }

  Future<void> _handlePayment() async {
    try {
      PaymentResponse response =
          await _purchaseVipApi.fetchPurchase(widget.premiumId);
      if (response.value.data.success &&
          await canLaunchUrl(Uri.parse(response.value.data.paymentUrl))) {
        await launchUrl(Uri.parse(response.value.data.paymentUrl));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Không thể mở đường dẫn thanh toán')),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi xử lý thanh toán: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment methods'),
        actions: [TextButton(onPressed: () {}, child: Text('Done'))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder<PremiumResponse>(
            future: _premiumFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Lỗi: ${snapshot.error}"));
              } else if (!snapshot.hasData) {
                return Center(child: Text("Không có dữ liệu"));
              }

              final premium = snapshot.data!;
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border:
                            Border.all(color: Colors.grey.shade800, width: 2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '1 tháng',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            premium.data.subscriptionPackage.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${premium.data.subscriptionPackage.price} vnd',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            '• 1 tài khoản Premium\n'
                            '• Hủy bất cứ lúc nào\n'
                            '• Đăng ký hoặc thanh toán một lần',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Button(
                          text: 'Thanh toán',
                          onPressed: _handlePayment,
                          buttonSize: Size(double.infinity, 40),
                          backgroundColor: Color(0xFF047099)),
                    ),
                  ]
              );
            },
          ),
        ),
      ),
    );
  }
}
