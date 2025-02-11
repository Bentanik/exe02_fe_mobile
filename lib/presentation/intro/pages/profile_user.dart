import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/profile_button.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/logout.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  final LogoutController _logoutController = LogoutController();
  bool isLoggedIn = true;
  String userAvatar = AppImages.chatBot; // Avatar mặc định

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
          onPressed: () => Navigator.pop(context),
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
                    backgroundImage: AssetImage(userAvatar),
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
              leading: Icon(FontAwesomeIcons.user, size: 20, color: Colors.black),
              title: Text('Personal Information'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: Icon(FontAwesomeIcons.cog, size: 20, color: Colors.black),
              title: Text('Settings'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: Icon(FontAwesomeIcons.creditCard, size: 20, color: Colors.black),
              title: Text('Payment Methods'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading: Icon(FontAwesomeIcons.history, size: 20, color: Colors.black),
              title: Text('Order History'),
            ),

            // Đăng xuất
            ProfileButton(
              onTap: () async {
                bool isSuccess = await _logoutController.logout();
                if (isSuccess && context.mounted) {
                  setState(() {
                    isLoggedIn = false;
                    userAvatar = "";
                  });
                  Routes.navigateToPage(context, Home());
                }
              },
              leading: Icon(FontAwesomeIcons.signOutAlt, size: 20, color: Colors.red),
              title: Text('Đăng xuất', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
