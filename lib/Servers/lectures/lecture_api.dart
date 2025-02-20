import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/lectures/lecture_detail_model.dart';

class LectureService {
  final Dio _dio = Api().api;

  Future<List<LectureModel>> fetchLectures(String chapterId) async {
    try {
      final response = await _dio.get(
        '/api/course/v1/get-lectures',
        queryParameters: {
          'searchTerm': chapterId,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data['value']['data']['lectures']['items'] as List<dynamic>;
        return data.map((item) => LectureModel.fromJson(item)).toList();
      } else {
        throw Exception("Lỗi khi lấy danh sách bài giảng");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }
}
