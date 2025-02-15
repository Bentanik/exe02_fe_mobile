import 'dart:convert';
import 'package:exe02_fe_mobile/Servers/chapter/chapters_api.dart';
import 'package:exe02_fe_mobile/Servers/course/course_detail_api.dart';
import 'package:exe02_fe_mobile/Servers/lectures/lecture_api.dart';
import 'package:exe02_fe_mobile/common/widget/dropdown_text.dart';
import 'package:exe02_fe_mobile/models/chapters/chapter_model.dart';
import 'package:exe02_fe_mobile/models/course/course_detail_model.dart';
import 'package:exe02_fe_mobile/models/lectures/lecture_model.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/lecture_video.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CourseDetail extends StatefulWidget {
  final String courseId;

  const CourseDetail({super.key, required this.courseId});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late Future<CourseDetailModel> courseFuture;
  late Future<ChapterResponse> chaptersFuture;

  final CourseDetailService _courseService = CourseDetailService();
  final ChapterService _chapterService = ChapterService();
  final LectureService _lectureService = LectureService();

  @override
  void initState() {
    super.initState();
    courseFuture = _courseService.fetchCourse(widget.courseId);
    chaptersFuture = _chapterService.fetchChapters(widget.courseId);
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
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          } else if (!snapshot.hasData) {
            return const Center(child: Text("Không có dữ liệu"));
          }

          final course = snapshot.data!;

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
                          const Icon(Icons.star, color: Colors.amber, size: 16),
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ExpandableText(text: course.description),
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
                        "Chương trình giảng dạy",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      FutureBuilder<ChapterResponse>(
                        future: chaptersFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text("Lỗi: ${snapshot.error}"));
                          } else if (!snapshot.hasData || snapshot.data!.chapters.isEmpty) {
                            return const Center(child: Text("Không có chương học"));
                          }

                          final chapterResponse = snapshot.data!;
                          final chapters = chapterResponse.chapters;

                          return Column(
                          children: chapters.map((chapter) {
                            return ExpansionTile(
                              title: Text(chapter.name),
                              children: [
                                FutureBuilder<List<LectureModel>>(
                                  future: _lectureService.fetchLectures(chapter.id), // Gọi API lấy lectures theo chapterId
                                  builder: (context, lectureSnapshot) {
                                    if (lectureSnapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(child: CircularProgressIndicator());
                                    } else if (lectureSnapshot.hasError) {
                                      return Center(child: Text("Lỗi: ${lectureSnapshot.error}"));
                                    } else if (!lectureSnapshot.hasData || lectureSnapshot.data!.isEmpty) {
                                      return const Center(child: Text("Không có bài giảng"));
                                    }

                                    final lectures = lectureSnapshot.data!;

                                    return Column(
                                      children: lectures.map((lecture) {
                                        return ListTile(
                                          title: Text(lecture.name),
                                          subtitle: Text("Thời lượng: ${lecture.videoLecture.duration} phút"),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LectureVideoPage(
                                                  videoUrl: 'https://res.cloudinary.com/tivas/video/upload/q_auto:good/AntiSCM/ljphl6ynwuqetlvoaqg3.m3u8',
                                                  lectureTitle: lecture.name,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    );
                                  },
                                ),
                              ],
                            );
                          }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
