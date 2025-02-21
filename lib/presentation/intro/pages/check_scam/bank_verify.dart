import 'package:exe02_fe_mobile/Servers/CheckScam/check_scam_api.dart';
import 'package:flutter/material.dart';

class BankVerifyBody extends StatefulWidget {
  @override
  _BankVerifyBodyState createState() => _BankVerifyBodyState();
}

class _BankVerifyBodyState extends State<BankVerifyBody> {
  final TextEditingController _bankController = TextEditingController();
  String resultText = "";

  void checkScam() async {
    String input = _bankController.text.trim();
    if (input.isEmpty) return;

    String result = await checkScamReport(input, "bank"); // Gọi API
    setState(() {
      resultText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Nhập số tài khoản ngân hàng vào dưới đây để kiểm tra độ an toàn của tài khoản đó .",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        TextField(
          controller: _bankController,
          decoration: InputDecoration(
            hintText: "Nhập số tài khoản ngân hàng",
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        const SizedBox(height: 20),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: checkScam,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: const Text("Kiểm tra", style: TextStyle(fontSize: 18)),
          ),
        ),

        const SizedBox(height: 20),

        const Text("Kết quả trả về:"),
        const SizedBox(height: 10),
        if (resultText.isNotEmpty)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black),
            ),
            child: Text(
              resultText,
              style: TextStyle(
                color: resultText.contains("❌") ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
