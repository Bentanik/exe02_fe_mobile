import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class SearchCourseCard extends StatelessWidget {
  final String category;
  final String title;
  final double rating;
  final int students;
  final bool isBookmarked;
  final String imageUrl;

  const SearchCourseCard({
    Key? key,
    required this.category,
    required this.title,
    required this.rating,
    required this.students,
    this.isBookmarked = false,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top:10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hình ảnh khóa học (giả lập bằng Container màu đen)
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Nội dung khóa học
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 8),
                      const Text("|", style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 8),
                      Text(
                        "$students Std",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Bookmark icon
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
