import 'package:exe02_fe_mobile/core/configs/theme/theme.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/light_dark_tongle.dart';
import 'package:exe02_fe_mobile/presentation/splash/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create:  (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: SplashPage(),
        theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: darkMode,
    );
  }
}
