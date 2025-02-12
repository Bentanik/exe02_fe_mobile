import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/premium_card.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
                    const Text(
                      'Premium',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '500.000 vnd',
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
              const SizedBox(
                height: 16,
              ),
              Text('CURRENT METHOD',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text(
                  'Choose desired vehicle type. We offer cars suitable for most everyday needs.'),
              SizedBox(height: 10),
              Column(
                children: [
                  PaymentCard(
                      brand: 'Mastercard',
                      lastDigits: '5967',
                      expiry: '09/25',
                      color: Colors.red),
                  PaymentCard(
                      brand: 'Visa',
                      lastDigits: '3802',
                      expiry: '10/27',
                      color: Colors.blue),
                  PaymentCard(
                      brand: 'PayPal',
                      lastDigits: 'petra_stark@email.com',
                      expiry: '',
                      color: Colors.blueAccent),
                ],
              ),
              SizedBox(height: 20),
              Center(
                child: Button(
                    text: 'Thanh toán ngay',
                    onPressed: () => Routes.navigateToPage(context, Success()),
                    buttonSize: Size(300, 40),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String brand;
  final String lastDigits;
  final String expiry;
  final Color color;

  PaymentCard(
      {required this.brand,
      required this.lastDigits,
      required this.expiry,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.credit_card, color: color),
        title: Text('$brand **** $lastDigits'),
        subtitle: expiry.isNotEmpty ? Text('Expires $expiry') : null,
      ),
    );
  }
}
