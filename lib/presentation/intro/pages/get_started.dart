import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/profile_button.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/login.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Started')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(
              children: [
                ProfileButton(
                  onTap: () => Routes.navigateToPage(context, Login()),
                  leading: const Icon(Icons.person_outline),
                  title: const Text('Personal Information'),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
