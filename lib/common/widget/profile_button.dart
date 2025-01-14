import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget {
  final Future<void> Function() onTap;

  const ProfileButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  State<ProfileButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<ProfileButton> {
  bool _isLoading = false;

  Future<void> _handleTap() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    await widget.onTap(); // Gọi callback từ widget cha

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:_isLoading ? null : _handleTap,
      child: ListTile(
        leading: const Icon(Icons.person_outline),
        title: const Text('Personal Information'),
        trailing: _isLoading
            ? const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        )
            : const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
