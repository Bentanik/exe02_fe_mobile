import 'package:exe02_fe_mobile/common/helpers/limit_word.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/core/configs/theme/theme.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/chat_bot.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/check_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/course_detail.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/light_dark_tongle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:exe02_fe_mobile/Servers/course/course_api.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/home_card.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/search_bar.dart';
import 'package:exe02_fe_mobile/models/course/course_model.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/login/login.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/register/register.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/categories.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/premium_option.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/profile_user.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/search_course.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Course> courses = [];
  bool isLoggedIn = false;
  String? userFullName;
  String? userAvatar;
  String? token;

  final storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _fetchCourses();
    _loadUserData();
  }

  _loadUserData() async {
    final storage = FlutterSecureStorage();
    userFullName = await storage.read(key: 'userFullName');
    userAvatar = await storage.read(key: 'userAvatarUrl');

    print("HomeScreen - User: $userFullName, Avatar: $userAvatar");

    setState(() {
      isLoggedIn = userFullName != null;
    });
  }

  Future<void> _fetchCourses({String searchTerm = ''}) async {
    try {
      CourseResponse courseResponse = await CourseService().fetchCourses(searchTerm);
      if (courseResponse.isSuccess) {
        setState(() {
          courses = courseResponse.data.items;
        });
      }
    } catch (e) {
      print("Lỗi khi tải khóa học: $e");
    }
  }

  void updateLoginState(bool status,
      {String? fullName, String? avatarUrl}) async {
    setState(() {
      isLoggedIn = status;
      userFullName = fullName ?? userFullName;
      userAvatar = avatarUrl ?? userAvatar;
    });
    if (status) {
      if (fullName != null)
        await storage.write(key: 'userFullName', value: fullName);
      if (avatarUrl != null)
        await storage.write(key: 'userAvatarUrl', value: avatarUrl);
    } else {
      storage.deleteAll();
    }
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.themeData == darkMode;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chào mừng!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  isLoggedIn
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Routes.navigateToPage(context, ProfileUser()),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: userAvatar != null
                                    ? NetworkImage(userAvatar!)
                                    : AssetImage(
                                            'assets/images/default_avatar.png')
                                        as ImageProvider,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                themeProvider.tongleTheme();
                              },
                              child: Icon(
                                isDarkMode
                                    ? Icons.nightlight_round
                                    : Icons.wb_sunny,
                                size: 20,
                                color:
                                    isDarkMode ? Colors.amber : Colors.orange,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            TextButton(
                              onPressed: () =>
                                  Routes.navigateToPage(context, Login()),
                              child: Text(
                                "Đăng nhập",
                                style: TextStyle(
                                  color: Color(0xFF047099)
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () =>
                                  Routes.navigateToPage(context, Register()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF047099),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text("Đăng ký",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 20),

              // Lời chào cá nhân hóa
              if (isLoggedIn)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Xin chào, ${userFullName ?? 'User'}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      "Có những gì nổi bật vào hôm nay ?",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    SizedBox(height: 20),
                  ],
                ),

              SearchField(
                onPressed: () => Routes.navigateToPage(context, SearchCourse()),
              ),
              SizedBox(height: 20),

              // Banner Welcome
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.home_bg),
                    fit: BoxFit.cover, // Phủ kín Container
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "antiSCM xin chào !",
                      style: TextStyle(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Cùng antiSCM khám phá những thông tin mới nào.",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Categories Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tính năng nổi bật",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () =>
                        Routes.navigateToPage(context, Categories()),
                    child: Text("Xem tất cả"),
                  ),
                ],
              ),

              // Các nút danh mục
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Button(
                      text: 'Nhắn với AI',
                      onPressed: () =>
                          Routes.navigateToPage(context, ChatBot()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF047099),
                    ),
                    SizedBox(width: 10),
                    Button(
                      text: 'Premium',
                      onPressed: () =>
                          Routes.navigateToPage(context, PremiumOption()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF047099),
                    ),
                    SizedBox(width: 10),
                    Button(
                      text: 'Kiểm tra lừa đảo',
                      onPressed: () =>
                          Routes.navigateToPage(context, ScamVerifierScreen()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF047099),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Hiển thị danh sách khóa học
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: courses
                      .map((course) => HomeCard(
                            imageUrl: course.thumbnail.publicUrl,
                            level: limitWords(
                                course.level?.name ?? "Không phân cấp độ", 3),
                            title: course.name,
                            onTap: () => Routes.navigateToPage(
                                context, CourseDetail(courseId: course.id)),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
