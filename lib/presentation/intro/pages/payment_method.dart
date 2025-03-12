import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/Servers/premiums/premium_detail_api.dart';
import 'package:exe02_fe_mobile/Servers/users/purchase_api.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/models/premiums/premium_detail_model.dart';
import 'package:exe02_fe_mobile/models/users/purchase_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethods extends StatefulWidget {
  final String premiumId;

  PaymentMethods({required this.premiumId});

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  PremiumData? premiumData;
  late PremiumApiService _premiumDetail;
  final PurchaseVipApi _purchaseVipApi = PurchaseVipApi(Api());

  @override
  void initState() {
    super.initState();
    _premiumDetail = PremiumApiService();
    _fetchPremiumDetail(widget.premiumId);
    // _handlePayment();
  }

  Future<void> _fetchPremiumDetail(String premiumId) async {
    try {
      var result = await _premiumDetail.fetchPremiums(premiumId);
      if (result != null && result.data != null) {
        setState(() {
          premiumData = result.data!.data;
        });
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi tải dữ liệu: ${error.toString()}')),
      );
    }
  }

  Future<void> _handlePayment() async {
    try {
      final response = await _purchaseVipApi.fetchPurchase(widget.premiumId);

      if (response.isSuccess && response.data?.value?.data.success == true) {
        final paymentUrl = response.data!.value!.data.paymentUrl;
        final url = Uri.parse(paymentUrl);

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          Fluttertoast.showToast(
            msg: "Không thể mở đường dẫn thanh toán!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      } else {
        Fluttertoast.showToast(
          msg: response.error ?? "Thanh toán thất bại!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Lỗi không xác định: ${e.toString()}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Đăng kí chi tiết'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPremiumInfo(),
            SizedBox(height: 20),
            Center(
              child: Button(
                text: 'Thanh toán',
                onPressed: _handlePayment,
                buttonSize: Size(double.infinity, 40),
                backgroundColor: Color(0xFF047099),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade800, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.cyan,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              premiumData?.subscriptionPackage.name ?? 'N/A',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Premium',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            '${premiumData?.subscriptionPackage.price ?? 0} vnd',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          const Text(
            '• 1 tài khoản Premium\n'
                '• Hủy bất cứ lúc nào\n'
                '• Đăng ký hoặc thanh toán một lần',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}
