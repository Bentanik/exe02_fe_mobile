import 'package:flutter/material.dart';

class Launching extends StatelessWidget {
  const Launching({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa theo chiều dọc
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image
              Image.asset('assets/images/logo.png', width: 200, height: 200),
              const SizedBox(height: 15),
              // Title
              const Text(
                "antiSCM",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Trust less, verify more",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF515151),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
