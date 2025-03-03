import 'package:dio/dio.dart';

class GeminiService {
  static const String _apiKey = "AIzaSyA6_y14wkK9lsnelN4fSDJy1fOq_1FvRlo";
  static const String _baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/tunedModels/antiscm-dg1g8e1wcdky:generateContent";

  final Dio _dio = Dio();

  Future<String?> getResponse(String prompt) async {
    try {
      Response response = await _dio.post(
        "$_baseUrl?key=$_apiKey",
        data: {
          "contents": [
            {
              "parts": [
                {"text": prompt}
              ]
            }
          ]
        },
      );

      print("📩 Full API Response: ${response.data}");

      if (response.data["candidates"] != null &&
          response.data["candidates"].isNotEmpty) {
        return response.data["candidates"][0]["content"]["parts"][0]["text"];
      }

      return "⚠️ Không có phản hồi hợp lệ.";
    } catch (error) {
      print("❌ Lỗi khi gọi API: $error");
      return "❌ Lỗi khi gọi API.";
    }
  }
}
