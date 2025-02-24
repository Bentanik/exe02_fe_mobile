import 'dart:convert';

class CourseResponse {
  final String code;
  final String message;
  final CourseData data;
  final bool isSuccess;
  final bool isFailure;
  final ErrorResponse error;

  CourseResponse({
    required this.code,
    required this.message,
    required this.data,
    required this.isSuccess,
    required this.isFailure,
    required this.error,
  });

  factory CourseResponse.fromJson(Map<String, dynamic> json) {
    print('json: $json');
    return CourseResponse(
      code: json['value']['code'] ?? '',
      message: json['value']['message'] ?? '',
      data: CourseData.fromJson(json['value']['data']['courses']),
      isSuccess: json['isSuccess'] ?? false,
      isFailure: json['isFailure'] ?? false,
      error: ErrorResponse.fromJson(json['error']),
    );
  }
}

class ErrorResponse {
  final String code;
  final String message;

  ErrorResponse({required this.code, required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      code: json['code'] ?? '',
      message: json['message'] ?? '',
    );
  }
}

class CourseData {
  final List<Course> items;
  final int pageIndex;
  final int pageSize;
  final int totalCount;
  final bool hasNextPage;
  final bool hasPreviousPage;

  CourseData({
    required this.items,
    required this.pageIndex,
    required this.pageSize,
    required this.totalCount,
    required this.hasNextPage,
    required this.hasPreviousPage,
  });

  factory CourseData.fromJson(Map<String, dynamic> json) {
    return CourseData(
      items: (json['items'] as List<dynamic>)
          .map((item) => Course.fromJson(item))
          .toList(),
      pageIndex: json['pageIndex'] ?? 1,
      pageSize: json['pageSize'] ?? 0,
      totalCount: json['totalCount'] ?? 0,
      hasNextPage: json['hasNextPage'] ?? false,
      hasPreviousPage: json['hasPreviousPage'] ?? false,
    );
  }
}

class Course {
  final String id;
  final String name;
  final String description;
  final Thumbnail thumbnail;
  final int quantityChapters;
  final Category? category;
  final Level? level;
  final List<Chapter> chapters;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.quantityChapters,
    this.category,
    this.level,
    required this.chapters,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      thumbnail: Thumbnail.fromJson(json['thumbnail']),
      quantityChapters: json['quantityChapters'] ?? 0,
      category: json['category'] != null ? Category.fromJson(json['category']) : null,
      level: json['level'] != null ? Level.fromJson(json['level']) : null,
      chapters: (json['chapters'] as List<dynamic>)
          .map((chapter) => Chapter.fromJson(chapter))
          .toList(),
    );
  }
}

class Thumbnail {
  final String publicId;
  final String publicUrl;

  Thumbnail({required this.publicId, required this.publicUrl});

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    return Thumbnail(
      publicId: json['publicId'] ?? '',
      publicUrl: json['publicUrl'] ?? '',
    );
  }
}

class Category {
  final String id;
  final String name;
  final int quantityCourses;

  Category({
    required this.id,
    required this.name,
    required this.quantityCourses,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Không thuộc thể loại cụ thể',
      quantityCourses: json['quantityCourses'] ?? 0,
    );
  }
}

class Level {
  final String id;
  final String name;
  final int quantityCourses;

  Level({
    required this.id,
    required this.name,
    required this.quantityCourses,
  });

  factory Level.fromJson(Map<String, dynamic> json) {
    return Level(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Không phân định level',
      quantityCourses: json['quantityCourses'] ?? 0,
    );
  }
}

class Chapter {
  final String id;
  final String courseId;
  final String name;
  final String description;
  final int quantityLectures;
  final int totalDurationLectures;
  final List<dynamic> lectures;

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
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      quantityLectures: json['quantityLectures'] ?? 0,
      totalDurationLectures: json['totalDurationLectures'] ?? 0,
      lectures: json['lectures'] as List<dynamic>? ?? [],
    );
  }
}
