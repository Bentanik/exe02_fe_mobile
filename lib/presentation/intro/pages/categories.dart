import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/category_card.dart';
import 'package:exe02_fe_mobile/common/widget/search_bar.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blogs_awareness.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/chat_bot.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/check_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/course_detail.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/courses.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/list_sign_of_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/premium_option.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            SearchField(),
            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ChatBot(  )),
                    title: 'Chatbot', 
                    imageUrl: AppImages.chatBot,
                    backgroundColor: Colors.pinkAccent,
                  ),

                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, Courses()),
                    title: 'Course',
                    imageUrl: AppImages.course,
                    backgroundColor: Colors.purpleAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, PremiumOption()),
                    title: 'Premium',
                    imageUrl: AppImages.premium,
                    backgroundColor: Colors.redAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ScamVerifierScreen()),
                    title: 'Check scam',
                    imageUrl: AppImages.check,
                    backgroundColor: Colors.greenAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, BlogsAwareness()),
                    title: 'Blog awareness',
                    imageUrl: AppImages.awareness,
                    backgroundColor: Colors.orangeAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ScamSignsList()),
                    title: 'Sign of scam',
                    imageUrl: AppImages.signal,
                    backgroundColor: Colors.blueAccent,
                  ),

                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, CourseDetail(courseId: "222",)),
                    title: 'Sign of scam',
                    imageUrl: AppImages.signal,
                    backgroundColor: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
