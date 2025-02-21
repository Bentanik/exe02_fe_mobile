import 'dart:ui';

import 'package:flutter/material.dart';

class SearchCourseCard extends StatelessWidget {
  final String? category;
  final String? level;
  final String title;
  // final double rating;
  // final int students;
  final bool isBookmarked;
  final String imageUrl;
  final VoidCallback onTap;

  const SearchCourseCard({
    Key? key,
    required this.category,
    required this.title,
    required this.level,
    // required this.rating,
    // required this.students,
    this.isBookmarked = false,
    required this.imageUrl,
    required this.onTap, // Đảm bảo bắt buộc truyền vào
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Gọi hàm onTap khi người dùng nhấn vào thẻ
      child: Container(
        margin: const EdgeInsets.only(top: 10),
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
            // Hình ảnh khóa học
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
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
                      level!,
                      style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          category!,
                          style: const TextStyle(fontSize: 12),
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
      ),
    );
  }
}
