import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/profile_button.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/profile_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'Setting',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
        child: Column(
          children: [
            // Profile Buttons
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: const Icon(FontAwesomeIcons.user,
                  size: 20, color: Colors.black),
              title: const Text('Personal Information'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: const Icon(FontAwesomeIcons.user,
                  size: 20, color: Colors.black),
              title: const Text('Personal Information'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: const Icon(FontAwesomeIcons.user,
                  size: 20, color: Colors.black),
              title: const Text('Personal Information'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: const Icon(FontAwesomeIcons.user,
                  size: 20, color: Colors.black),
              title: const Text('Personal Information'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: const Icon(FontAwesomeIcons.user,
                  size: 20, color: Colors.black),
              title: const Text('Personal Information'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: const Icon(FontAwesomeIcons.user,
                  size: 20, color: Colors.black),
              title: const Text('Personal Information'),
            ),
          ],
        ),
      ),
    );
  }
}
