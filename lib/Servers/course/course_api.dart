import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/course.dart';

class CourseService {
  final Dio _dio = Api().api;

  Future<List<Course>> fetchCourses() async {
    print("⏳ Đang gọi API...");
    try {
      print("📡 Đang thực hiện request API...");
      final response = await _dio.get('/api/course/v1/get-courses?searchTerm=Kh&sortColumn=&includes=Chapter');
      print("✅ API Response: ${response.data}");

      if (response.statusCode == 200) {
        return (response.data['value']['data']['courses']['items'] as List)
            .map((item) => Course.fromJson(item))
            .toList();
      } else {
        throw Exception("Lỗi khi lấy dữ liệu khóa học");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối: $e");
    }
  }
}
