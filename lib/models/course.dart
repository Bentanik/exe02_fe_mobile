import 'dart:convert';

class CourseResponse {
  final String code;
  final String message;
  final List<Course> courses;
  final bool isSuccess;

  CourseResponse({
    required this.code,
    required this.message,
    required this.courses,
    required this.isSuccess,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    return CourseResponse(
      code: json['value']['code'] ?? '',
      message: json['value']['message'] ?? '',
      isSuccess: json['isSuccess'] ?? false,
      courses: (json['value']['data']['courses']['items'] as List<dynamic>)
          .map((item) => Course.fromJson(item))
          .toList(),
    );
  }
}

class Course {
  final String id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final int quantityChapters;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.quantityChapters,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      thumbnailUrl: json['thumbnail']['publicUrl'] ?? '',
      quantityChapters: json['quantityChapters'] ?? 0,
    );
  }
}
