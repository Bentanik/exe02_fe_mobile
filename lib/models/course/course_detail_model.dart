class CourseDetailModel {
  final String id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final int quantityChapters;

  CourseDetailModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.quantityChapters,
  });

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailModel(
      id: json['value']['data']['course']['id'] ?? '',
      name: json['value']['data']['course']['name'] ?? '',
      description: json['value']['data']['course']['description'] ?? '',
      thumbnailUrl: json['value']['data']['course']['thumbnail']['publicUrl'] ?? '',
      quantityChapters: json['value']['data']['course']['quantityChapters'] ?? 0,
    );
  }
}
