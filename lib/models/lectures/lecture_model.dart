

class LectureModel {
  final String id;
  final String chapterId;
  final String name;
  final String description;
  final ImageLecture imageLecture;
  final VideoLecture videoLecture;

  LectureModel({
    required this.id,
    required this.chapterId,
    required this.name,
    required this.description,
    required this.imageLecture,
    required this.videoLecture,
  });

  factory LectureModel.fromJson(Map<String, dynamic> json) {
    return LectureModel(
      id: json['id'] ?? '',
      chapterId: json['chapterId'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageLecture: ImageLecture.fromJson(json['imageLecture']),
      videoLecture: VideoLecture.fromJson(json['videoLecture']),
    );
  }
}

class ImageLecture {
  final String publicId;
  final String publicUrl;

  ImageLecture({
    required this.publicId,
    required this.publicUrl,
  });

  factory ImageLecture.fromJson(Map<String, dynamic> json) {
    return ImageLecture(
      publicId: json['publicId'] ?? '',
      publicUrl: json['publicUrl'] ?? '',
    );
  }
}

class VideoLecture {
  final String publicId;
  final double duration;

  VideoLecture({
    required this.publicId,
    required this.duration,
  });

  factory VideoLecture.fromJson(Map<String, dynamic> json) {
    return VideoLecture(
      publicId: json['publicId'] ?? '',
      duration: (json['duration'] ?? 0.0).toDouble(),
    );
  }
}