import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/home_card.dart';
import 'package:exe02_fe_mobile/common/widget/notification_card.dart';
import 'package:exe02_fe_mobile/common/widget/profile_button.dart';
import 'package:exe02_fe_mobile/common/widget/search_course_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/recover_password.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blog_awareness_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Started')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: ListView(
              children: [
                ProfileButton(
                  onTap: () => Routes.navigateToPage(context, BlogAwarenessDetail()),
                  leading: const Icon(FontAwesomeIcons.user,
                      size: 20, color: Colors.black),
                  title: const Text('Personal Information'),
                ),
                SearchCourseCard(
                  category: 'Security course',
                  title: 'Security 3',
                  rating: 4.2,
                  students: 7830,
                  isBookmarked: true,
                  imageUrl: AppImages.bg,
                ),
                NotificationCard(
                    title: 'Thong báo',
                    desc: 'Hôm nay là thứ 7',
                    leading: const Icon(Icons.person_outline)),
                HomeCard(
                  imageUrl: AppImages.bg,
                  category: "Awareness 2",
                  title: "Blog about awareness 1",
                  isBookmarked: true,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
