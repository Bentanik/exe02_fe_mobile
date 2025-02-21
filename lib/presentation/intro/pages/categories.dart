import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/category_card.dart';
import 'package:exe02_fe_mobile/common/widget/search_bar.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blogs_awareness.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/chat_bot.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/check_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/courses.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/lecture_video.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/list_sign_of_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/premium_option.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.background,title: const Text('Các tính năng')),
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
                    title: 'Nhắn tin với AI',
                    imageUrl: AppImages.chatBot,
                    backgroundColor: Colors.pinkAccent,
                  ),

                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, Courses()),
                    title: 'Khóa học',
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
                    title: 'Kiểm tra lừa đảo',
                    imageUrl: AppImages.check,
                    backgroundColor: Colors.greenAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, BlogsAwareness()),
                    title: 'Bài viết nhân thức',
                    imageUrl: AppImages.awareness,
                    backgroundColor: Colors.orangeAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ScamSignsList()),
                    title: 'Dấu hiệu lừa đảo',
                    imageUrl: AppImages.signal,
                    backgroundColor: Colors.blueAccent,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () =>
                        Routes.navigateToPage(context, YouTubeEmbed()),
                    title: 'Check video',
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
