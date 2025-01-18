import 'package:exe02_fe_mobile/common/widget/curriculcum_item.dart';
import 'package:flutter/material.dart';

class Curriculcum extends StatelessWidget {
  const Curriculcum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Curriculcum')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Color(0xFFEDF4FF), // Đặt màu nền cho ListView
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListView(
            children: [
              // Section 01
              Text(
                'Section 01',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              CurriculcumItem(number: '1', title: 'Khóa học số 1', duration: '30 phút'),
              CurriculcumItem(number: '2', title: 'Khóa học số 2', duration: '30 phút', isLocked: true),
              CurriculcumItem(number: '3', title: 'Khóa học số 3', duration: '30 phút', isLocked: true),

              const SizedBox(height: 20),
              Text(
                'Section 02',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 15),
              CurriculcumItem(number: '4', title: 'Khóa học số 4', duration: '30 phút', isLocked: true),
              CurriculcumItem(number: '5', title: 'Khóa học số 5', duration: '30 phút', isLocked: true),
              CurriculcumItem(number: '6', title: 'Khóa học số 6', duration: '30 phút', isLocked: true),
              CurriculcumItem(number: '7', title: 'Khóa học số 7', duration: '30 phút', isLocked: true),
            ],
          ),
        ),
      ),
    );
  }
}
