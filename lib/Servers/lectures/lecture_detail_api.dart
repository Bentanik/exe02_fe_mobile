import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/ApiResponse/api_exception.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/lectures/lecture_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LectureDetailService {
  final Dio _dio = Api().api;

  Future<ApiResponse<LectureModel>> fetchLectureById(
      BuildContext context, String lectureId) async {
    try {
      final response = await _dio.get(
        '/api/course/v1/get-lecture-by-id',
        queryParameters: {'lectureId': lectureId},
      );

      final data = response.data['value']['data']['lecture'];
      return ApiResponse(data: LectureModel.fromJson(data));
    } on DioException catch (e) {
      var errorData = e.response?.data;
      String errorMessage = errorData?['detail'] ?? "Lỗi không xác định từ server";

      final responseError = errorMessage.contains(
          "Lỗi không xác định")
          ? "Bạn cần đăng nhập để xem được video": errorMessage;

      return ApiResponse(error: responseError);
    } catch (e) {
      return ApiResponse(error: "Đã xảy ra lỗi không xác định: $e");
    }
  }
}
