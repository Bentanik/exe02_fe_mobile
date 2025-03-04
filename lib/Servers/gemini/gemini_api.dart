import 'package:dio/dio.dart';

class GeminiService {
  static const String _apiKey = "AIzaSyBR1WTendmzoOLpFvlMgBHd4G8Td6THlwI";
  static const String _baseUrl =
      "https://generativelanguage.googleapis.com/v1beta/tunedModels/trainaiantiscm-ujhljfzje9a9:generateContent";
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

      if (response.data["candidates"] != null &&
          response.data["candidates"].isNotEmpty) {
        return response.data["candidates"][0]["content"]["parts"][0]["text"];
      }
      return "Không có phản hồi hợp lệ.";
    } catch (error) {
      print("Lỗi khi gọi API: $error");
      return "Xin lỗi! Bot xảy ra lỗi.";
    }
  }
}
