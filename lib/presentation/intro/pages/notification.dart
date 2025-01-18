import 'package:exe02_fe_mobile/common/widget/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Today
                Text(
                  'Hôm nay',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                NotificationCard(
                    title: 'khóa học mới',
                    desc: 'Vừa ra vào 1 giờ trước',
                    leading: Icon(FontAwesomeIcons.addressBook),
                ),
                const SizedBox(height: 10),
                NotificationCard(
                  title: 'khóa học mới',
                  desc: 'Vừa ra vào 1 giờ trước',
                  leading: Icon(FontAwesomeIcons.addressBook),
                ),
                const SizedBox(height: 10),
                NotificationCard(
                  title: 'khóa học mới',
                  desc: 'Vừa ra vào 1 giờ trước',
                  leading: Icon(FontAwesomeIcons.addressBook),
                ),
                const SizedBox(height: 20),
                Text(
                  'Hôm qua',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                NotificationCard(
                  title: 'khóa học mới',
                  desc: 'Vừa ra vào 1 giờ trước',
                  leading: Icon(FontAwesomeIcons.addressBook),
                ),
                const SizedBox(height: 10),
                NotificationCard(
                  title: 'khóa học mới',
                  desc: 'Vừa ra vào 1 giờ trước',
                  leading: Icon(FontAwesomeIcons.addressBook),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
