import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/category_card.dart';
import 'package:exe02_fe_mobile/common/widget/search_bar.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blogs_awareness.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/check_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/web_verify.dart';
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

            // Bọc trong Expanded và ListView để có thể cuộn
            Expanded(
              child: ListView(
                children: [
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, Success()),
                    title: 'Chatbot',
                    imageUrl: AppImages.chatBot,
                    backgroundColor: Colors.pinkAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, Success()),
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
                    backgroundColor: Colors.pinkAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, BlogsAwareness()),
                    title: 'Blog awareness',
                    imageUrl: AppImages.chatBot,
                    backgroundColor: Colors.pinkAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ScamSignsList()),
                    title: 'Blog awareness',
                    imageUrl: AppImages.chatBot,
                    backgroundColor: Colors.pinkAccent,
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
