import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/ApiResponse/api_exception.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/models/lectures/lecture_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LectureDetailService {
  final Dio _dio = Api().api;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();


  Future<ApiResponse<LectureModel>> fetchLectureById(
      BuildContext context, String lectureId) async {
    try {

      var checkAccess = await _storage.read(key: 'accessToken');
      if (checkAccess == null || checkAccess.isEmpty) {
        return ApiResponse(error: "Bạn cần đăng nhập để xem được video này!");
      }

      var check = _dio.options.headers['Authorization'] = 'Bearer $checkAccess';


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
          ? "Vui lòng đăng nhập lại để xem video": errorMessage;

      return ApiResponse(error: responseError);
    } catch (e) {
      return ApiResponse(error: "Đã xảy ra lỗi không xác định: $e");
    }
  }
}
