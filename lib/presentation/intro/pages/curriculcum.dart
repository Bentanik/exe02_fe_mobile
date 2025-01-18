import 'package:exe02_fe_mobile/common/widget/curriculcum_item.dart';
import 'package:exe02_fe_mobile/common/widget/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Curriculcum extends StatelessWidget {
  const Curriculcum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Curriculcum')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
            padding: const EdgeInsets.all(16), // Thêm padding nhẹ để nội dung không dính sát vào viền
            decoration: BoxDecoration(
              color: Color(0xFFEDF4FF), // Màu nền cho Container
              borderRadius: BorderRadius.circular(12), // Bo góc nhẹ cho đẹp hơn
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Đổ bóng nhẹ
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Today
                Text(
                  'Section 01',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                CurriculcumItem(number: '1', title: 'Khóa học số 1', duration: '30'),
                const SizedBox(height: 5),
                CurriculcumItem(number: '2', title: 'Khóa học số 2', duration: '30', isLocked: true,),
                const SizedBox(height: 5),
                CurriculcumItem(number: '3', title: 'Khóa học số 3', duration: '30', isLocked: true,),

                const SizedBox(height: 20),
                Text(
                  'Section 02',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                CurriculcumItem(number: '1', title: 'Khóa học số 1', duration: '30', isLocked: true,),
                const SizedBox(height: 5),
                CurriculcumItem(number: '2', title: 'Khóa học số 2', duration: '30', isLocked: true,),
                const SizedBox(height: 5),
                CurriculcumItem(number: '3', title: 'Khóa học số 3', duration: '30', isLocked: true,),
                const SizedBox(height: 5),
                CurriculcumItem(number: '4', title: 'Khóa học số 3', duration: '30', isLocked: true,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
