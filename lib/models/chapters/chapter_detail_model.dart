import 'dart:convert';

class ChapterResponse {
  final String code;
  final String message;
  final ChapterData data;

  ChapterResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ChapterResponse.fromJson(Map<String, dynamic> json) {
    final value = json['value']; // Lấy phần "value" từ JSON
    return ChapterResponse(
      code: value['code'],
      message: value['message'],
      data: ChapterData.fromJson(value['data']),
    );
  }
}

class ChapterData {
  final Chapter chapter;

  ChapterData({required this.chapter});

  factory ChapterData.fromJson(Map<String, dynamic> json) {
    return ChapterData(
      chapter: Chapter.fromJson(json['chapter']),
    );
  }
}

class Chapter {
  final String id;
  final String courseId;
  final String name;
  final String description;
  final int quantityLectures;
  final double totalDurationLectures;
  final List<Lecture> lectures;

  Chapter({
    required this.id,
    required this.courseId,
    required this.name,
    required this.description,
    required this.quantityLectures,
    required this.totalDurationLectures,
    required this.lectures,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      id: json['id'] ?? '',
      courseId: json['courseId'] ?? '',
      name: json['name'] ?? 'Không có tiêu đề',
      description: json['description'] ?? '',
      quantityLectures: json['quantityLectures'] ?? 0,
      totalDurationLectures: json['totalDurationLectures'] ?? 0,
      lectures: (json['lectures'] as List?)
          ?.map((lecture) => Lecture.fromJson(lecture))
          .toList() ??
          [], // Nếu null thì gán danh sách rỗng
    );
  }
}


class Lecture {
  final String id;
  final String chapterId;
  final String name;
  final String description;

  Lecture({
    required this.id,
    required this.chapterId,
    required this.name,
    required this.description,
  });

  factory Lecture.fromJson(Map<String, dynamic> json) {
    return Lecture(
      id: json['id'] ?? '',
      chapterId: json['chapterId'] ?? '',
      name: json['name'] ?? 'Không có tiêu đề',
      description: json['description'] ?? '',
    );
  }
}
