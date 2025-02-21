import 'package:exe02_fe_mobile/Servers/course/course_api.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/search_course_card.dart';
import 'package:exe02_fe_mobile/models/course/course_model.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/course_detail.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/filters.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}
class _CoursesState extends State<Courses> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    print("🔍 Bắt đầu gọi API từ Home");
    try {
      CourseResponse courseResponse = await CourseService().fetchCourses();

      if (courseResponse.isSuccess) {
        setState(() {
          courses = courseResponse.data.items;
        });
      } else {
        print("Lỗi từ API: ${courseResponse.message}");
      }
    } catch (e) {
      print("Lỗi khi tải khóa học: $e");
    } finally {
      setState(() {}); // Đảm bảo UI cập nhật dù có lỗi hay không
    }
  }

  String _limitWords(String text, int maxWords) {
    List<String> words = text.split(' ');
    return words.length > maxWords ? '${words.take(maxWords).join(' ')}...' : text;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Course online')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search for...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.list_rounded, color: Colors.blue),
                    onPressed: () => Routes.navigateToPage(context, Filters()),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Courses section
            const Text(
              'Courses you might like',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Course cards
            Expanded(
              child: ListView(
                children: courses.map((course) => SearchCourseCard(
                  imageUrl: course.thumbnail.publicUrl,
                  onTap: () => Routes.navigateToPage(context, CourseDetail(courseId: course.id)),
                  category: _limitWords(course.category!.name, 4),
                  level: _limitWords(course.level!.name, 3),
                  title: course.name,
                  isBookmarked: false,
                )).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
