import 'package:exe02_fe_mobile/presentation/intro/pages/get_started.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    // redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text("Màn hình chờ"),
        )
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if(!mounted) return;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute (builder:
            (BuildContext context) => const GetStartedPage()),
    );
  }
}
