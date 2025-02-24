import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/lectures/lecture_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LectureDetailService {
  final Dio _dio = Api().api;
  FlutterSecureStorage _storage = FlutterSecureStorage();

  Future<LectureModel> fetchLectureById(
      BuildContext context, String lectureId) async {
    try {
      var checkAccess = await _storage.read(key: 'accessToken');
      if (checkAccess == null || checkAccess.isEmpty) {
        throw Exception("Bạn cần đăng nhập để xem được video này!");
      }
      final response = await _dio.get(
        '/api/course/v1/get-lecture-by-id',
        queryParameters: {'lectureId': lectureId},
      );
      final data = response.data['value']['data']['lecture'];
      return LectureModel.fromJson(data);
    } on DioException catch (e) {
      var errorData = e.response?.data;
      print('data: ${errorData}');
      String errorMessage =
          errorData['detail'] ?? "Lỗi không xác định từ server";
      print("Bắt lỗi trong try-catch:");
      print("Title: ${errorData['title']}");
      print("Status: ${e.response?.statusCode}");
      print("Detail: $errorMessage");
      print("Error Code: ${errorData['errorCode']}");

      throw Exception(errorMessage);
    } catch (e) {
      if (e.toString().contains("đăng nhập")) {
        throw e; // Ném lỗi giữ nguyên mà không thêm text
      } else {
        throw Exception("Đã xảy ra lỗi không xác định: $e");
      }
    }
  }
}
