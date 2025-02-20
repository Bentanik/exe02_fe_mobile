class LecturesModel {
  final String id;
  final String chapterId;
  final String name;
  final String description;

  LecturesModel({
    required this.id,
    required this.chapterId,
    required this.name,
    required this.description,
  });

  factory LecturesModel.fromJson(Map<String, dynamic> json) {
    return LecturesModel(
      id: json['id'] ?? '',
      chapterId: json['chapterId'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
    );
  }
}