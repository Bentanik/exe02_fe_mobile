import 'package:exe02_fe_mobile/models/chapters/chapters_model.dart';

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
    final courseJson = json['value']?['data']?['course'] ?? {};

    return CourseDetailModel(
      id: courseJson['id'] ?? '',
      name: courseJson['name'] ?? '',
      description: courseJson['description'] ?? '',
      thumbnailUrl: courseJson['thumbnail']?['publicUrl'] ?? '',
      quantityChapters: courseJson['quantityChapters'] ?? 0,
      categoryName: courseJson['category']?['name'] ?? 'Không phân loại',
      levelName: courseJson['level']?['name'] ?? 'Không phân cấp độ',
      chapters: (courseJson['chapters'] as List<dynamic>?)
          ?.map((chapter) => ChapterModel.fromJson(chapter))
          .toList() ??
          [],
    );
  }
}
