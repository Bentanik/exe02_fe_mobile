import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/category_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blogs_awareness.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/chat_bot.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/check_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/courses.dart';
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
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ChatBot(  )),
                    title: 'Nhắn tin với AI',
                    imageUrl: AppImages.chatBot,
                    backgroundImage: AppImages.cate1,
                  ),

                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, Courses()),
                    title: 'Khóa học',
                    imageUrl: AppImages.course,
                    backgroundImage: AppImages.cate2,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, DonationOption()),
                    title: 'Ủng hộ chúng tôi',
                    imageUrl: AppImages.donate,
                    backgroundImage: AppImages.cate3,
                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ScamVerifierScreen()),
                    title: 'Kiểm tra lừa đảo',
                    imageUrl: AppImages.check,
                    backgroundImage: AppImages.cate4,

                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, BlogsAwareness()),
                    title: 'Bài viết nhân thức',
                    imageUrl: AppImages.awareness,
                    backgroundImage: AppImages.cate5,

                  ),
                  const SizedBox(height: 10),
                  CategoryCard(
                    onPress: () => Routes.navigateToPage(context, ScamSignsList()),
                    title: 'Dấu hiệu lừa đảo',
                    imageUrl: AppImages.signal,
                    backgroundImage: AppImages.cate6,
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
