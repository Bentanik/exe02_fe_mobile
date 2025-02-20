import 'package:exe02_fe_mobile/Servers/chapter/chapters_api.dart';
import 'package:exe02_fe_mobile/Servers/chapter/get_chapter_by_id_api.dart';
import 'package:exe02_fe_mobile/Servers/course/course_detail_api.dart';
import 'package:exe02_fe_mobile/common/widget/dropdown_text.dart';
import 'package:exe02_fe_mobile/models/chapters/chapter_detail_model.dart';
import 'package:exe02_fe_mobile/models/chapters/chapters_model.dart';
import 'package:exe02_fe_mobile/models/course/course_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iconsax/iconsax.dart';

class CourseDetail extends StatefulWidget {
  final String courseId;

  const CourseDetail({super.key, required this.courseId});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late Future<CourseDetailModel> courseFuture;
  late Future<ChaptersResponse> chaptersFuture;
  Map<String, Future<ChapterResponse>> chapterDetails = {};
  String? token;
  final storage = FlutterSecureStorage();

  _loadUserData() async {
    token = await storage.read(key: 'accessToken');
  }

  final CourseDetailService _courseService = CourseDetailService();
  final ChaptersService _chaptersService = ChaptersService();
  final ChapterService _chapterService = ChapterService();

  @override
  void initState() {
    super.initState();
    courseFuture = _courseService.fetchCourse(widget.courseId);
    chaptersFuture = _chaptersService.fetchChapters(widget.courseId);
    _loadUserData();
  }

  Future<void> _fetchChapterDetails(String chapterId) async {
    if (!chapterDetails.containsKey(chapterId)) {
      setState(() {
        chapterDetails[chapterId] = _chapterService.fetchChapter(chapterId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Detail"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<CourseDetailModel>(
        future: courseFuture,
        builder: (context, courseSnapshot) {
          if (courseSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (courseSnapshot.hasError) {
            return Center(child: Text("Lỗi: ${courseSnapshot.error}"));
          } else if (!courseSnapshot.hasData) {
            return const Center(child: Text("Không có dữ liệu"));
          }

          final course = courseSnapshot.data!;

          return FutureBuilder<ChaptersResponse>(
            future: chaptersFuture,
            builder: (context, chapterSnapshot) {
              if (chapterSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (chapterSnapshot.hasError) {
                return Center(child: Text("Lỗi: ${chapterSnapshot.error}"));
              } else if (!chapterSnapshot.hasData ||
                  chapterSnapshot.data!.chapters.isEmpty) {
                return const Center(child: Text("Không có chương học"));
              }

              final chapters = chapterSnapshot.data!.chapters;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          course.thumbnailUrl,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 16),
                              Text("4 (100 đánh giá)"),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text("Lần cập nhật gần nhất: 12 giờ trước"),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Mô tả về khóa học",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ExpandableText(text: course.description),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Chương trình giảng dạy",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ...chapters.map((chapter) {
                            return Card(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              elevation: 3,
                              child: ExpansionTile(
                                tilePadding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                title: Text(
                                  chapter.name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading:
                                const Icon(Iconsax.book, color: Colors.blue),
                                onExpansionChanged: (isExpanded) {
                                  if (isExpanded) {
                                    _fetchChapterDetails(chapter.id);
                                  }
                                },
                                children: [
                                  FutureBuilder<ChapterResponse>(
                                    future: chapterDetails[chapter.id],
                                    builder: (context, lectureSnapshot) {
                                      if (lectureSnapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      } else if (lectureSnapshot.hasError) {
                                        return Center(
                                            child: Text(
                                                "Lỗi: ${lectureSnapshot.error}"));
                                      } else if (!lectureSnapshot.hasData ||
                                          lectureSnapshot.data!.data.chapter.lectures!.isEmpty) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Center(
                                              child: Text("Không có bài giảng")),
                                        );
                                      }

                                      return Column(
                                        children: lectureSnapshot.data!.data.chapter.lectures!
                                            .map((lecture) {
                                          return ListTile(
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 4),
                                            leading: const Icon(
                                                Icons.play_circle_fill,
                                                color: Colors.green,
                                                size: 28),
                                            title: Text(
                                              lecture.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
