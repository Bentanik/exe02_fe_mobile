import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/register/register.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/get_started.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/launching.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/profile_user.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/term_condition.dart';
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
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Launching();
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    if(!mounted) return;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute (builder:
            (BuildContext context) => Home()),
    );
  }
}
