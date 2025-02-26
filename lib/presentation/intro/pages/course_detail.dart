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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';

class CourseDetail extends StatefulWidget {
  final String courseId;

  const CourseDetail({super.key, required this.courseId});

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  CourseDetailModel? courseDetail;
  List<ChapterModel>? chapters;
  Map<String, ChapterResponse?> chapterDetails = {};
  final CourseDetailService _courseDetailService = CourseDetailService();
  final ChaptersService _chaptersService = ChaptersService();
  final ChapterService _chapterService = ChapterService();
  final LectureDetailService _lectureDetailService = LectureDetailService();

  @override
  void initState() {
    super.initState();
    _fetchCourseDetail(widget.courseId);
    _fetchChapters(widget.courseId);
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

  Future<void> _fetchChapters(String courseId) async {
    try {
      final chaptersResponse = await _chaptersService.fetchChapters(courseId);
      setState(() {
        chapters = chaptersResponse.chapters;
      });
    } catch (error) {
      print('Lỗi khi tải danh sách chương: $error');
    }
  }

  Future<void> _fetchChapterDetails(String chapterId) async {
    if (!chapterDetails.containsKey(chapterId)) {
      try {
        final chapterResponse = await _chapterService.fetchChapter(chapterId);
        setState(() {
          chapterDetails[chapterId] = chapterResponse;
        });
      } catch (error) {
        print('Lỗi khi tải chi tiết chương: $error');
      }
    }
  }

  Future<LectureModel?> getLectureDetail(String lectureId) async {
    final result = await _lectureDetailService.fetchLectureById(context, lectureId);

    if (result.isSuccess) {
      return result.data;
    } else {
      Fluttertoast.showToast(
        msg: result.error!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      return null;
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
                    if (chapters == null)
                      const Center(child: CircularProgressIndicator())
                    else if (chapters!.isEmpty)
                      const Center(child: Text("Không có chương học"))
                    else
                      Column(
                        children: chapters!.map((chapter) {
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
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              leading: const Icon(Iconsax.book,
                                  color: Colors.blue),
                              onExpansionChanged: (isExpanded) {
                                if (isExpanded) {
                                  _fetchChapterDetails(chapter.id);
                                }
                              },
                              children: [
                                if (!chapterDetails.containsKey(chapter.id))
                                  const Center(
                                      child: CircularProgressIndicator())
                                else if (chapterDetails[chapter.id] == null ||
                                    chapterDetails[chapter.id]!.data.chapter
                                        .lectures!.isEmpty)
                                  const Padding(
                                    padding: EdgeInsets.all(16),
                                    child:
                                    Center(child: Text("Bài giảng chưa có video")),
                                  )
                                else
                                  Column(
                                    children: chapterDetails[chapter.id]!
                                        .data.chapter.lectures!
                                        .map((lecture) {
                                      return ListTile(
                                        contentPadding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 4),
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
                                            final result = await getLectureDetail(lecture.id);

                                            if (result != null) {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => LectureVideo(videoId: result.videoLecture?.publicId),
                                                ),
                                              );
                                            }
                                          } catch (e) {
                                            Fluttertoast.showToast(
                                              msg: e.toString(),
                                              toastLength: Toast.LENGTH_LONG,
                                              gravity: ToastGravity.TOP,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                            );
                                          }
                                        },
                                      );
                                    }).toList(),
                                  ),
                              ],
                            ),
                          );
                        }).toList(),
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

