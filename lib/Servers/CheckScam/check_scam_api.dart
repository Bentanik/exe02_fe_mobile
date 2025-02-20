import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> checkScamReport(String value, String type) async {
  final Uri url = Uri.parse("https://api-scam-report.authenticate.id.vn/check?value=$value&type=$type");

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      bool exists = data["exists"];
      String message = data["message"];
      return exists ? "❌ Phát hiên lừa đảo: $message" : "✅ An toàn: Không tìm thấy báo cáo nào.";
    }
    return "❌ Error: ${response.statusCode}";
  } catch (e) {
    return "❌ Connection error: $e";
  }
}
