import 'package:exe02_fe_mobile/common/widget/category_card.dart';
import 'package:exe02_fe_mobile/common/widget/search_bar.dart';
import 'package:exe02_fe_mobile/common/widget/search_course_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> products = [
      {
        "title": "Beats Solo 1",
        "icon": Icons.headphones,
        "backgroundColor": Colors.pinkAccent[100],
      },
      {
        "title": "Beats Solo 2",
        "icon": Icons.headphones,
        "backgroundColor": Colors.purpleAccent[100],
      },
      {
        "title": "Beats Solo 3",
        "icon": Icons.headphones,
        "backgroundColor": Colors.redAccent[100],
      },
      {
        "title": "Beats Solo 2",
        "icon": Icons.headphones,
        "backgroundColor": Colors.purpleAccent[100],
      },
      {
        "title": "Beats Solo 1",
        "icon": Icons.headphones,
        "backgroundColor": Colors.pinkAccent[100],
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Search Bar
            SearchField(),
            const SizedBox(height: 10),

            // Course cards
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: products.length,
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return CategoryCard(
                    title: product['title'],
                    icon: product['icon'],
                    backgroundColor: product['backgroundColor']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
