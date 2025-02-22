import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  final String duration;
  final String price;
  final Color backgroundColor;
  final Color textColor;
  final bool isSelected;
  final VoidCallback onTap;

  const PremiumCard({
    Key? key, required this.duration, required this.price,required this.backgroundColor, required this.textColor
  , required this.onTap, required this.isSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Gọi hàm khi nhấn vào Container
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? Color(0xFF047099) : Colors.grey.shade800, width: 2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                duration,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Premium',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '• 1 tài khoản Premium\n'
                  '• Hủy bất cứ lúc nào\n'
                  '• Đăng ký hoặc thanh toán một lần',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
