import 'package:exe02_fe_mobile/Servers/CheckScam/check_scam_api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WebVerifyBody extends StatefulWidget {
  @override
  _WebVerifyBodyState createState() => _WebVerifyBodyState();
}

class _WebVerifyBodyState extends State<WebVerifyBody> {
  final TextEditingController _webController = TextEditingController();
  String resultText = "";

  void checkScam() async {
    String input = _webController.text.trim();
    if (input.isEmpty || !RegExp(r'^\d{10}$').hasMatch(input)) {
      Fluttertoast.showToast(
        msg: "Vui lòng nhập đúng định dạng 10 số!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );
      return;
    }
    if (input.isEmpty) return;


    String result =
        await checkScamReport(input, "phone");
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
          "Nhập số điện thoại vào dưới đây để kiểm tra độ an toàn của số điện thoại.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _webController,
          decoration: InputDecoration(
            hintText: "Nhập số điện thoại",
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
              backgroundColor: Color(0xFF047099),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            child: const Text("Kiểm tra",
                style: TextStyle(color: Colors.white, fontSize: 15)),
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
