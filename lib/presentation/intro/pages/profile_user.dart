import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/profile_button.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
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
            // Header
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    child: Image.asset(AppImages.chatBot),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'James S. Hernandez',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'hernandez.redial@gmail.ac.in',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
