import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/home_card.dart';
import 'package:exe02_fe_mobile/common/widget/notification_card.dart';
import 'package:exe02_fe_mobile/common/widget/profile_button.dart';
import 'package:exe02_fe_mobile/common/widget/search_course_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/login/login.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/recover_password.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/register/register.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blog_awareness_detail.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blogs_awareness.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/books_mark.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/categories.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/check_scam/check_scam.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/curriculcum.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

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
                Button(text: 'test', onPressed: () => checkVideo()),
                NotificationCard(
                    title: 'Thong báo',
                    desc: 'Hôm nay là thứ 7',
                    leading: const Icon(Icons.person_outline)),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Future<void> checkVideo() async {
    var url =
        "https://res.cloudinary.com/tivas/video/upload/q_auto:good/AntiSCM/t97zttkt07ef0emrkdt4.mp4";
    var response = await http.get(Uri.parse(url));
    print("Status code: ${response.statusCode}");
    print("Headers: ${response.headers}");
  }
}
