import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorDialog({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Đã xảy ra lỗi"),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Đóng popup
            onRetry(); // Gọi lại đăng ký
          },
          child: const Text("Thử lại"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context), // Chỉ đóng popup
          child: const Text("Đóng"),
        ),
      ],
    );
  }
}
