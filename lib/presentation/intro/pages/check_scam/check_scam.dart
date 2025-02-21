import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/bank_verify.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/web_verify.dart';
import 'package:flutter/material.dart';
class ScamVerifierScreen extends StatefulWidget {
  @override
  _ScamVerifierScreenState createState() => _ScamVerifierScreenState();
}

class _ScamVerifierScreenState extends State<ScamVerifierScreen> {
  bool isBankVerify = true; // Trạng thái tab

  void switchTab(bool isBank) {
    setState(() {
      isBankVerify = isBank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(title: const Text('Kiểm tra lừa đảo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nút chuyển tab
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () => switchTab(true),
                        style: ElevatedButton.styleFrom(
                        backgroundColor: isBankVerify ? Colors.blue : Colors.white,
                        foregroundColor: isBankVerify ? Colors.white : Colors.black,
                      ),
                      child: const Text("Ngân hàng"),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => switchTab(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isBankVerify ? Colors.blue : Colors.white,
                        foregroundColor: !isBankVerify ? Colors.white : Colors.black,
                      ),
                      child: const Text("Số điện thoại"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Load Widget con tùy theo tab
            Expanded(
              child: isBankVerify ? BankVerifyBody() : WebVerifyBody(),
            ),
          ],
        ),
      ),
    );
  }
}
