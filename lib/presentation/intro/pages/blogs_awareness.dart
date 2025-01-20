import 'package:exe02_fe_mobile/common/widget/blog_card.dart';
import 'package:exe02_fe_mobile/common/widget/feature_blog_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class BlogsAwareness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsItems = [
      {
        'category': 'Technology',
        'title':
        'Insurtech startup PasarPolis gets \$54 million — Series B',
        'imageUrl': AppImages.bg,
      },
      {
        'category': 'Technology',
        'title':
        'The IPO parade continues as Wish files, Bumble targets',
        'imageUrl': AppImages.bg,
      },
      {
        'category': 'Technology',
        'title':
        'The IPO parade continues as Wish files, Bumble targets',
        'imageUrl': AppImages.bg,
      },
      {
        'category': 'Technology',
        'title':
        'The IPO parade continues as Wish files, Bumble targets',
        'imageUrl': AppImages.bg,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Blogs Awareness')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Blogs Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Blogs',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 220, // Chiều cao cố định cho blog container
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return FeatureBlogCard(
                          category: 'Technology',
                          title: 'Blog headline ${index + 1}',
                          imageUrl: AppImages.bg,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Latest News Section
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Latest News',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    itemCount: newsItems.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(), // Không cuộn độc lập
                    itemBuilder: (context, index) {
                      final news = newsItems[index];
                      return BlogCard(
                        category: news['category']!,
                        title: news['title']!,
                        imageUrl: news['imageUrl']!,
                      );
                    },
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
