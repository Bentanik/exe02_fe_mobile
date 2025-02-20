import 'dart:convert';

import 'package:exe02_fe_mobile/models/lectures/lecture_detail_model.dart';
import 'package:exe02_fe_mobile/models/lectures/lectures_model.dart';

class ChaptersResponse {
  final String code;
  final String message;
  final List<ChapterModel> chapters;
  final bool isSuccess;


  ChaptersResponse({
    required this.code,
    required this.message,
    required this.chapters,
    required this.isSuccess,
  });

  factory ChaptersResponse.fromJson(Map<String, dynamic> json) {
    return ChaptersResponse(
      code: json['value']['code'] ?? '',
      message: json['value']['message'] ?? '',
      isSuccess: json['isSuccess'] ?? false,
      chapters: (json['value']['data']['chapters']['items'] as List<dynamic>)
          .map((item) => ChapterModel.fromJson(item))
          .toList(),
    );
  }
}

class ChapterModel {
  final String id;
  final String courseId;
  final String name;
  final String description;
  final int quantityLectures;
  final double totalDurationLectures;
  final List<LecturesModel> lectures;

  ChapterModel({
    required this.id,
    required this.courseId,
    required this.name,
    required this.description,
    required this.quantityLectures,
    required this.totalDurationLectures,
    required this.lectures,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'] ?? '',
      courseId: json['courseId'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      quantityLectures: json['quantityLectures'] ?? 0,
      totalDurationLectures: (json['totalDurationLectures'] ?? 0.0).toDouble(),
      lectures: (json['lectures'] as List<dynamic>? ?? [])
          .map((lecture) => LecturesModel.fromJson(lecture))
          .toList(),
    );
  }
}

