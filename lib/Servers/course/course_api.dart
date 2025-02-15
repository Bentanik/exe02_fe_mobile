import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/course/course_model.dart';

class CourseService {
  final Dio _dio = Api().api;

  Future<CourseResponse> fetchCourses() async {
    try {
      final response = await _dio.get('/api/course/v1/get-courses?searchTerm=Kh&sortColumn=&includes=Chapter');

      if (response.statusCode == 200) {
        return CourseResponse.fromJson(response.data);
      } else {
        throw Exception("Lỗi khi lấy dữ liệu khóa học");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }
}
