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
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Course> courses = [];
  bool isLoggedIn = false;
  String userAvatar = "";

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    print("🔍 Bắt đầu gọi API từ Home");
    try {
      CourseResponse courseResponse = await CourseService().fetchCourses();

      if (courseResponse.isSuccess) {
        setState(() {
          courses = courseResponse.courses;
        });
      } else {
        print("Lỗi từ API: ${courseResponse.message}");
      }
    } catch (e) {
      print("Lỗi khi tải khóa học: $e");
    } finally {
      setState(() {}); // Đảm bảo UI cập nhật dù có lỗi hay không
    }
  }


  void updateLoginState(bool status, {String? avatarUrl}) {
    setState(() {
      isLoggedIn = status;
      if (avatarUrl != null) {
        userAvatar = avatarUrl;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section: Đăng nhập / Đăng ký hoặc Avatar User
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  isLoggedIn
                      ? GestureDetector(
                          onTap: () =>
                              Routes.navigateToPage(context, ProfileUser()),
                          // Chuyển đến trang profile
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(userAvatar),
                          ),
                        )
                      : Row(
                          children: [
                            TextButton(
                              onPressed: () => Routes.navigateToPage(context,
                                  Login(updateLoginState: updateLoginState)),
                              child: Text("Đăng nhập"),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () =>
                                  Routes.navigateToPage(context, Register()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
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

              // Section: Chào hỏi
              Text(
                "Hi, Cristiano Ronaldo",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "What would you like to learn today?",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),

              SearchField(onPressed: () => Routes.navigateToPage(context, SearchCourse()),),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to antiSCM",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Guess what are hot news today?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Danh mục
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Routes.navigateToPage(context, Categories()),
                    child: Text("SEE ALL"),
                  ),
                ],
              ),

              // Các nút danh mục
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Button(
                        text: 'Chatbot',
                        onPressed: () =>
                            Routes.navigateToPage(context, Success()),
                        buttonSize: Size(100, 40),
                        backgroundColor: Color(0xFF167F71)),
                    SizedBox(width: 10),
                    Button(
                        text: 'Premium',
                        onPressed: () =>
                            Routes.navigateToPage(context, PremiumOption()),
                        buttonSize: Size(100, 40),
                        backgroundColor: Color(0xFF167F71)),
                    SizedBox(width: 10),
                    Button(
                        text: 'Check scam',
                        onPressed: () =>
                            Routes.navigateToPage(context, Success()),
                        buttonSize: Size(100, 40),
                        backgroundColor: Color(0xFF167F71)),
                  ],
                ),
              ),

              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: courses
                      .map((course) => HomeCard(
                            imageUrl: course.thumbnailUrl,
                            category: 'Course',
                            title: course.name,
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
