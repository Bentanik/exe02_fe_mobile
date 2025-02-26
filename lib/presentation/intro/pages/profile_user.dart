import 'package:flutter/material.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/profile_button.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/logout.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/language.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/light_dark_mode.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/notification.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/term_condition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileUser extends StatefulWidget {
  @override
  _ProfileUserState createState() => _ProfileUserState();
}

class _ProfileUserState extends State<ProfileUser> {
  final LogoutController _logoutController = LogoutController();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  bool isLoggedIn = true;
  String userFullName = "Loading...";
  String userEmail = "Loading...";
  String userAvatar = AppImages.chatBot;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    String? fullName = await _storage.read(key: 'userFullName');
    String? email = await _storage.read(key: 'userEmail');
    String? avatarUrl = await _storage.read(key: 'userAvatarUrl');

    setState(() {
      userFullName = fullName ?? "Chưa có tên";
      userEmail = email ?? "Chưa có email";
      userAvatar = avatarUrl ?? AppImages.chatBot;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'Hồ sơ người dùng',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
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
                    backgroundImage: userAvatar.isNotEmpty
                        ? NetworkImage(userAvatar)
                        : AssetImage(AppImages.chatBot) as ImageProvider,
                  ),
                  SizedBox(height: 10),
                  Text(
                    userFullName,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    userEmail,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Buttons
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, ProfileUser()),
              leading:
              Icon(FontAwesomeIcons.user, size: 20, color: Theme.of(context).colorScheme.primary,),
              title: Text('Chỉnh sửa hồ sơ'),
            ),
            // ProfileButton(
            //   onTap: () => Routes.navigateToPage(context, Language()),
            //   leading:
            //   Icon(FontAwesomeIcons.cog, size: 20, color: Theme.of(context).colorScheme.primary,),
            //   title: Text('Tùy chỉnh ngôn ngữ'),
            // ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, NotificationPage()),
              leading: Icon(FontAwesomeIcons.creditCard,
                size: 20, color: Theme.of(context).colorScheme.primary,),
              title: Text('Thông báo'),
            ),
            ProfileButton(
              onTap: () => Routes.navigateToPage(context, TermsAndConditions()),
              leading:
              Icon(FontAwesomeIcons.history, size: 20, color: Theme.of(context).colorScheme.primary,),
              title: Text('Chính sách người dùng'),
            ),

            // Đăng xuất
            ProfileButton(
              onTap: () async {
                bool isSuccess = await _logoutController.logout();
                if (isSuccess && context.mounted) {
                  await _storage.deleteAll(); // Xóa dữ liệu sau khi đăng xuất
                  setState(() {
                    isLoggedIn = false;
                    userFullName = "Loading...";
                    userEmail = "Loading...";
                    userAvatar = AppImages.chatBot;
                  });
                  Routes.navigateToPage(context, Home());
                }
              },
              leading: Icon(FontAwesomeIcons.signOutAlt,
                  size: 20, color: Colors.red),
              title: Text('Đăng xuất', style: TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }
}
