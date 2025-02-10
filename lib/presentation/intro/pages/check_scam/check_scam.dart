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
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Scam Verifier", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Nút chuyển tab
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
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
                      child: const Text("Bank Verify"),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => switchTab(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isBankVerify ? Colors.blue : Colors.white,
                        foregroundColor: !isBankVerify ? Colors.white : Colors.black,
                      ),
                      child: const Text("Web Verify"),
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
