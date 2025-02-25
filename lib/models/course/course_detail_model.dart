import 'package:exe02_fe_mobile/models/chapters/chapters_model.dart';

class CourseDetailResponse {
  final String code;
  final String message;
  final CourseDetailModel data;
  final bool isSuccess;
  final bool isFailure;
  final ErrorResponse error;

  CourseDetailResponse({
    required this.code,
    required this.message,
    required this.data,
    required this.isSuccess,
    required this.isFailure,
    required this.error,
  });

  factory CourseDetailResponse.fromJson(Map<String, dynamic> json) {
    print('json: $json');
    return CourseDetailResponse(
      code: json['value']['code'] ?? '',
      message: json['value']['message'] ?? '',
      data: CourseDetailModel.fromJson(json['value']['data']['course']),
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


class CourseDetailModel {
  final String id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final int quantityChapters;
  final String categoryName;
  final String levelName;
  final List<ChapterModel> chapters;

  CourseDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.quantityChapters,
    required this.categoryName,
    required this.levelName,
    required this.chapters,
  });

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      thumbnailUrl: json['thumbnail']?['publicUrl'] ?? '',
      quantityChapters: json['quantityChapters'] ?? 0,
      categoryName: json['category']?['name'] ?? 'Không phân loại',
      levelName: json['level']?['name'] ?? 'Không phân cấp độ',
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((chapter) => ChapterModel.fromJson(chapter))
          .toList() ?? [],
    );
  }
}
