import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart'; // Import LoadingButton
import 'package:exe02_fe_mobile/common/widget/drop_down.dart';
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
            Button(
              text: 'Login',
              onPressed: () => Routes.navigateToPage(context, Login()),
              backgroundColor: Colors.blue,
              textColor: Colors.white,
            ),
            const SizedBox(height: 20),
            const DropDown(),
          ],
        ),
      ),
    );
  }
}


