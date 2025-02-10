import 'package:flutter/material.dart';

class BankVerifyBody extends StatefulWidget {
  @override
  _BankVerifyBodyState createState() => _BankVerifyBodyState();
}

class _BankVerifyBodyState extends State<BankVerifyBody> {
  final TextEditingController _bankController = TextEditingController();
  String resultText = "";

  void checkScam() {
    String input = _bankController.text.trim();
    if (input.isEmpty) return;

    setState(() {
      resultText = "This bank number $input is a scam number";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Protect yourself from fraud by verifying every bank account you interact with.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        TextField(
          controller: _bankController,
          decoration: InputDecoration(
            hintText: "Drop your bank number",
            filled: true,
            fillColor: Colors.white,
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
            child: const Text("Start Check", style: TextStyle(fontSize: 18)),
          ),
        ),

        const SizedBox(height: 20),

        const Text("The result show in here"),
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
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
      ],
    );
  }
}
