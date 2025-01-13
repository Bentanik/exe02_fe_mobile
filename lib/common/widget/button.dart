import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final String text;
  final Future<void> Function() onPressed; // Nhận callback async
  final Color backgroundColor;
  final Color textColor;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  State<Button> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<Button> {
  bool _isLoading = false; // Trạng thái loading

  Future<void> _handlePress() async {
    if (_isLoading) return; // Tránh nhấn nhiều lần

    setState(() {
      _isLoading = true; // Bắt đầu loading
    });

    await widget.onPressed(); // Thực thi callback

    setState(() {
      _isLoading = false; // Kết thúc loading
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _handlePress,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
      ),
      child: _isLoading
          ? const SizedBox(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.red,
              ),
            )
          : Text(
              widget.text,
              style: TextStyle(color: widget.textColor, fontSize: 16),
            ),
    );
  }
}
