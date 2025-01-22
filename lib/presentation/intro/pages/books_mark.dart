import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/notification_card.dart';
import 'package:exe02_fe_mobile/common/widget/search_course_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooksMark extends StatelessWidget {
  const BooksMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Button(
                        text: 'All',
                        onPressed: () =>
                            Routes.navigateToPage(context, Success()),
                        buttonSize: Size(100, 40),
                        backgroundColor: Color(0xFF167F71),
                      ),
                      const SizedBox(width: 10),
                      Button(
                        text: 'Application security',
                        onPressed: () =>
                            Routes.navigateToPage(context, Success()),
                        buttonSize: Size(100, 40),
                        backgroundColor: Color(0xFF167F71),
                      ),
                      const SizedBox(width: 10),
                      Button(
                        text: 'Application security',
                        onPressed: () =>
                            Routes.navigateToPage(context, Success()),
                        buttonSize: Size(100, 40),
                        backgroundColor: Color(0xFF167F71),
                      ),
                      // Thêm các Button khác nếu cần
                    ],
                  ),
                ),
                SearchCourseCard(
                  category: 'Security course',
                  title: 'Security 3',
                  rating: 4.2,
                  students: 7830,
                  isBookmarked: true,
                  imageUrl: AppImages.bg,
                ),
                SearchCourseCard(
                  category: 'Security course',
                  title: 'Security 3',
                  rating: 4.2,
                  students: 7830,
                  isBookmarked: true,
                  imageUrl: AppImages.bg,
                ),
                SearchCourseCard(
                  category: 'Security course',
                  title: 'Security 3',
                  rating: 4.2,
                  students: 7830,
                  isBookmarked: true,
                  imageUrl: AppImages.bg,
                ),
                SearchCourseCard(
                  category: 'Security course',
                  title: 'Security 3',
                  rating: 4.2,
                  students: 7830,
                  isBookmarked: true,
                  imageUrl: AppImages.bg,
                ),
                SearchCourseCard(
                  category: 'Security course',
                  title: 'Security 3',
                  rating: 4.2,
                  students: 7830,
                  isBookmarked: true,
                  imageUrl: AppImages.bg,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
