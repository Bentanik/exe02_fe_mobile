import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/Servers/users/purchase_api.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentMethods extends StatefulWidget {
  final String donationAmount;
  final String donationDescription;

  PaymentMethods({
    required this.donationAmount,
    required this.donationDescription,
  });

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  // Sử dụng API thanh toán có thể dùng chung cho donation.
  final PurchaseVipApi _purchaseVipApi = PurchaseVipApi(Api());

  Future<void> _handlePayment() async {
    try {
      final response = await _purchaseVipApi.fetchPurchase(
        price: widget.donationAmount,
        description: widget.donationDescription,
      );

      if (response.isSuccess &&
          response.data?.value?.data.success == true) {
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

  Widget _buildDonationInfo() {
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
          Text(
            'Bạn ủng hộ số tiền',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            '${widget.donationAmount} vnd',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 16),
          widget.donationDescription.isNotEmpty
              ? Text(
            widget.donationDescription,
            style: TextStyle(fontSize: 16, height: 1.5),
          )
              : Text(
            'Không có mô tả thêm.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Ủng hộ chi tiết'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDonationInfo(),
            SizedBox(height: 20),
            Center(
              child: Button(
                text: 'Ủng hộ',
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
}
