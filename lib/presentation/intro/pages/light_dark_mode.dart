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

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          title: const Text('Trạng thái màn hình')),
      body: Center(
        child: CupertinoSwitch(
          value: themeProvider.themeData == darkMode,
          onChanged: (value) {
            themeProvider.tongleTheme();
          },
        ),
      ),
    );
  }
}
