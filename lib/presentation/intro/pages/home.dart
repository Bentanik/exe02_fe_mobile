import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/home_card.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/search_bar.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
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
              // Search bar
              SearchField(),
              SizedBox(height: 20),
              // Banner
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

              // Categories
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
                    onPressed: () {},
                    child: Text("SEE ALL"),
                  ),
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                      text: 'All',
                      onPressed: () =>
                          Routes.navigateToPage(context, Success()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                    Button(
                      text: 'Chatbot',
                      onPressed: () =>
                          Routes.navigateToPage(context, Success()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                    Button(
                      text: 'News',
                      onPressed: () =>
                          Routes.navigateToPage(context, Success()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                    Button(
                      text: 'Support',
                      onPressed: () =>
                          Routes.navigateToPage(context, Success()),
                      buttonSize: Size(100, 40),
                      backgroundColor: Color(0xFF167F71),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Popular Courses
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
                    onPressed: () {},
                    child: Text("SEE ALL"),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HomeCard(
                        imageUrl: AppImages.bg,
                        category: 'Security',
                        title: 'Security 1'),
                    HomeCard(
                        imageUrl: AppImages.bg,
                        category: 'Security',
                        title: 'Security 1'),
                    HomeCard(
                        imageUrl: AppImages.bg,
                        category: 'Security',
                        title: 'Security 1'),
                    HomeCard(
                        imageUrl: AppImages.bg,
                        category: 'Security',
                        title: 'Security 1'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Top Mentor
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
