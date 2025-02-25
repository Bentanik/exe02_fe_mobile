import 'package:exe02_fe_mobile/Servers/chapter/chapters_api.dart';
import 'package:exe02_fe_mobile/Servers/chapter/get_chapter_by_id_api.dart';
import 'package:exe02_fe_mobile/Servers/course/course_detail_api.dart';
import 'package:exe02_fe_mobile/Servers/lectures/lecture_detail_api.dart';
import 'package:exe02_fe_mobile/common/widget/dropdown_text.dart';
import 'package:exe02_fe_mobile/models/chapters/chapter_detail_model.dart';
import 'package:exe02_fe_mobile/models/chapters/chapters_model.dart';
import 'package:exe02_fe_mobile/models/course/course_detail_model.dart';
import 'package:exe02_fe_mobile/models/lectures/lecture_detail_model.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/lecture_video.dart';
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
  CourseDetailModel? courseDetail;
  late Future<ChaptersResponse> chaptersFuture;
  Map<String, Future<ChapterResponse>> chapterDetails = {};
  final storage = FlutterSecureStorage();
  final CourseDetailService _courseDetailService = CourseDetailService();
  final ChaptersService _chaptersService = ChaptersService();
  final ChapterService _chapterService = ChapterService();

  @override
  void initState() {
    super.initState();
    _fetchCourseDetail(widget.courseId);
    chaptersFuture = _chaptersService.fetchChapters(widget.courseId);
  }

  Future<void> _fetchCourseDetail(String courseId) async {
    try {
      final courseDetailResponse =
          await _courseDetailService.fetchCourseDetail(courseId);
      setState(() {
        courseDetail = courseDetailResponse.data;
      });
    } catch (error) {
      print('Lỗi khi tải chi tiết khóa học: $error');
    }
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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Chi tiết khóa học"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (courseDetail != null) ...[
              Stack(
                children: [
                  Image.network(
                    courseDetail!.thumbnailUrl ?? '',
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
                      courseDetail!.name ?? 'Không có tên',
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
                      "Phân loại khóa học",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                        'Độ khó: ${courseDetail!.levelName ?? 'Không xác định'}'),
                    const SizedBox(height: 10),
                    Text(
                        'Thể loại: ${courseDetail!.categoryName ?? 'Không xác định'}'),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    ExpandableText(text: courseDetail!.description),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    FutureBuilder<ChaptersResponse>(
                      future: chaptersFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text("Lỗi: ${snapshot.error}"));
                        } else if (!snapshot.hasData ||
                            snapshot.data!.chapters.isEmpty) {
                          return const Center(
                              child: Text("Không có chương học"));
                        }

                        final chapters = snapshot.data!.chapters;
                        return Column(
                          children: chapters.map((chapter) {
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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                leading: const Icon(Iconsax.book,
                                    color: Colors.blue),
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
                                          lectureSnapshot.data!.data.chapter
                                              .lectures!.isEmpty) {
                                        return const Padding(
                                          padding: EdgeInsets.all(16),
                                          child: Center(
                                              child: Text(
                                                  "Bài giảng chưa có video")),
                                        );
                                      }

                                      return Column(
                                        children: lectureSnapshot
                                            .data!.data.chapter.lectures
                                            .map((lecture) {
                                          return ListTile(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 4),
                                            leading: Icon(
                                                Icons.play_circle_fill,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                size: 28),
                                            title: Text(
                                              lecture.name,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onTap: () async {
                                              try {
                                                LectureDetailService
                                                    lectureService =
                                                    LectureDetailService();
                                                LectureModel? lectureDetail =
                                                    await lectureService
                                                        .fetchLectureById(
                                                            context,
                                                            lecture.id);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LectureVideo(
                                                            videoId: lectureDetail
                                                                ?.videoLecture
                                                                ?.publicId),
                                                  ),
                                                );
                                              } catch (e) {
                                                // Xử lý lỗi (có thể hiện thông báo lỗi)
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content:
                                                          Text(e.toString())),
                                                );
                                              }
                                            },
                                          );
                                        }).toList(),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ] else
              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
