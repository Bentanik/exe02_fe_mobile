import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/course/course_model.dart';
import 'package:exe02_fe_mobile/models/course/course_detail_model.dart';
import 'package:exe02_fe_mobile/models/lectures/lecture_detail_model.dart';

class LectureDetailService {
  final Dio _dio = Api().api;

  Future<LectureModel> fetchLectureById(String lectureId) async {
    try {
      final response = await _dio.get(
        '/api/course/v1/get-lecture-by-id',
        queryParameters: {
          'lectureId': lectureId,
        },
      );

      var responseData = response.data;
      var value = responseData['value']; // Lấy phần `value`
      var lecture = value?['data']?['lecture']; // Lấy `lecture`
      return LectureModel.fromJson(lecture);
    } catch (e) {

      if (e is DioException) {
        var errorData = e.response?.data;
        print("Bắt lỗi trong try-catch:");
        print("Title: ${errorData?['title']}");
        print("Status: ${errorData?['status']}");
        print("Detail: ${errorData?['detail']}");
        print("Error Code: ${errorData?['errorCode']}");
      } else {

      }
      throw Exception("Loi nguoi dung chua dang ky goi");
    }
  }
}
