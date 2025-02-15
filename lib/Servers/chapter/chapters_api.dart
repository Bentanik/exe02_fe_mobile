import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/chapters/chapter_model.dart';

class ChapterService {
  final Dio _dio = Api().api;

  Future<ChapterResponse> fetchChapters(String courseId) async {
    try {
      final response = await _dio.get(
        '/api/course/v1/get-chapters',
        queryParameters: {
          'searchTerm': courseId,
        },
      );

      if (response.statusCode == 200) {
        return ChapterResponse.fromJson(response.data);
      } else {
        throw Exception("Lỗi khi lấy danh sách chương");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }
}
