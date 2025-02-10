import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/home_card.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/search_bar.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/logout.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/categories.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/premium_option.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final LogoutController _logoutController = LogoutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(),
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
                    onPressed: () => Routes.navigateToPage(context, Categories()),
                    child: Text("SEE ALL"),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Button(
                      text: 'All',
                      onPressed: () => Routes.navigateToPage(context, Success()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                    const SizedBox(width: 10,),
                    Button(
                      text: 'Chatbot',
                      onPressed: () => Routes.navigateToPage(context, Success()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                    const SizedBox(width: 10,),
                    Button(
                      text: 'Premium',
                      onPressed: () => Routes.navigateToPage(context, PremiumOption()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                    const SizedBox(width: 10,),
                    Button(
                      text: 'Check scam',
                      onPressed: () => Routes.navigateToPage(context, Success()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Courses",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () => Routes.navigateToPage(context, Categories()),
                    child: Text("SEE ALL"),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    4,
                        (index) => HomeCard(
                      imageUrl: AppImages.bg,
                      category: 'Security',
                      title: 'Security 1',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Mentor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("SEE ALL"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) => _buildMentorAvatar()),
              ),
              SizedBox(height: 16),
              Center(
                child: Button(
                  onPressed: () async {
                    bool isSuccess = await _logoutController.logout();
                    if (isSuccess && context.mounted) {
                      Routes.navigateToPage(context, Success());
                    }
                  },
                  text: 'Đăng xuất',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMentorAvatar() {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey[300],
    );
  }
}
