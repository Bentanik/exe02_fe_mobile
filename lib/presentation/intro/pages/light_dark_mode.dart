import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class LightDarkMode extends StatefulWidget {
  const LightDarkMode({Key? key}) : super(key: key);

  @override
  State<LightDarkMode> createState() => _LightDarkModeScreenState();
}

class _LightDarkModeScreenState extends State<LightDarkMode> {
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dark mode')),

      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Row(
          children: [
            Expanded(
              child: _buildModeOption(
                title: "Light",
                isSelected: !isDarkMode,
                image: AppImages.chatBot, // Replace with your light mode image
                onTap: () {
                  setState(() {
                    isDarkMode = false;
                  });
                },
              ),
            ),
            Expanded(
              child: _buildModeOption(
                title: "Dark",
                isSelected: isDarkMode,
                image: AppImages.bg, // Replace with your dark mode image
                onTap: () {
                  setState(() {
                    isDarkMode = true;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModeOption({
    required String title,
    required bool isSelected,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image,
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Colors.blue : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle,
                    color: Colors.blue,
                    size: 16,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
