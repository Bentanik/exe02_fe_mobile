import 'package:exe02_fe_mobile/presentation/intro/pages/light_dark_tongle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exe02_fe_mobile/core/configs/theme/theme.dart';

class LightDarkMode extends StatefulWidget {
  const LightDarkMode({super.key});

  @override
  State<LightDarkMode> createState() => _LightDarkModeState();
}

class _LightDarkModeState extends State<LightDarkMode> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeData == darkMode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Chế độ giao diện',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                themeProvider.tongleTheme();
              },
              child: Icon(
                isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                size: 60,
                color: isDarkMode ? Colors.amber : Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}