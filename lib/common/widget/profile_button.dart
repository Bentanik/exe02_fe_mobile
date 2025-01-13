
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ProfileButton extends StatefulWidget {
  final String text;
  final Future<void> Function() onPressed; // Nhận callback async
  final Color backgroundColor;
  final Color textColor;
  final Widget? icon;

  const ProfileButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  State<ProfileButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<ProfileButton> {
  bool _isLoading = false;

  Future<void> _handlePress() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await widget.onPressed();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _handlePress,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        ),
        child: _isLoading
            ? const SizedBox(
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.red,
          ),
        )
            :
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget.icon ?? const SizedBox(),
                const SizedBox(width: 8),
                Text(
                  widget.text,
                  style: TextStyle(color: widget.textColor, fontSize: 16),
                ),
              ],
            ),
            Icon(Icons.chevron_right, color: widget.textColor, size: 30,),
          ],
        ),
      ),
    );
  }
}
