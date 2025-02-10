import 'package:flutter/material.dart';

class WebVerifyBody extends StatefulWidget {
  @override
  _WebVerifyBodyState createState() => _WebVerifyBodyState();
}

class _WebVerifyBodyState extends State<WebVerifyBody> {
  final TextEditingController _webController = TextEditingController();
  String resultText = "";

  void checkScam() {
    String input = _webController.text.trim();
    if (input.isEmpty) return;

    setState(() {
      resultText = "This web scam";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Protect yourself from fraud by verifying every website you interact with.",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        TextField(
          controller: _webController,
          decoration: InputDecoration(
            hintText: "Drop web URL",
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
