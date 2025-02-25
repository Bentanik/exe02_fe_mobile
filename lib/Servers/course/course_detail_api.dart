import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/course/course_model.dart';
import 'package:exe02_fe_mobile/models/course/course_detail_model.dart';

class CourseDetailService {
  final Dio _dio = Api().api;

  Future<CourseDetailResponse> fetchCourseDetail(String courseId) async {
    try {
      final response = await _dio.get(
        '/api/course/v1/get-course-by-id',
        queryParameters: {
          'courseId': courseId,
          'includes': ['Chapter', 'Level', 'Category'],
        },
      );
      print('checkk: ${response.data}');
      if (response.statusCode == 200) {
        return CourseDetailResponse.fromJson(response.data);
      } else {
        throw Exception("Lỗi khi lấy dữ liệu khóa học");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }
}
