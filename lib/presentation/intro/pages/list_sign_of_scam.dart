import 'package:flutter/material.dart';

class ScamSignsList extends StatelessWidget {
  final List<Map<String, String>> scamArticles = [
    {
      'title': 'Đường link lạ, giả mạo thương hiệu',
      'description':
      'Địa chỉ website có lỗi chính tả hoặc sử dụng tên miền lạ (vd: abc-bank.xyz thay vì abc-bank.com). Thường yêu cầu nhấp vào link để nhận thưởng, xác nhận tài khoản, v.v.',
      'tagColor': '0xFFFFF3D0', // Light yellow
    },
    {
      'title': 'Nội dung mơ hồ, hấp dẫn quá mức',
      'description':
      'Hứa hẹn kiếm tiền dễ dàng, trúng thưởng lớn mà không cần làm gì. Dùng từ ngữ khẩn cấp như: "Chỉ còn 1 suất duy nhất", "Hành động ngay để không bỏ lỡ!".',
      'tagColor': '0xFFFFCDD2', // Light red
    },
    {
      'title': 'Yêu cầu cung cấp thông tin cá nhân, tài khoản',
      'description':
      'Hỏi mật khẩu, mã OTP, số thẻ ngân hàng, hoặc thông tin cá nhân. Giả mạo ngân hàng, công ty tài chính để yêu cầu xác minh danh tính.',
      'tagColor': '0xFFC8E6C9', // Light green
    },
    {
      'title': 'Chuyển tiền trước để nhận quà hoặc đầu tư',
      'description':
      'Bắt đóng phí trước khi nhận thưởng, hàng hóa, hoặc đầu tư sinh lời cao. Kêu gọi góp vốn, nhưng không có thông tin công ty rõ ràng.',
      'tagColor': '0xFFBBDEFB', // Light blue
    },
    {
      'title': 'Giả danh cơ quan chức năng, người nổi tiếng',
      'description':
      'Mạo danh công an, tòa án, ngân hàng để đe dọa hoặc yêu cầu đóng tiền phạt. Giả mạo người nổi tiếng kêu gọi quyên góp, đầu tư.',
      'tagColor': '0xFFD1C4E9', // Light purple
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'Dấu hiệu nhận biết',
        ),
        // backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: scamArticles.length,
        itemBuilder: (context, index) {
          final article = scamArticles[index];
          return Card(
            margin: EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tag
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Color(int.parse(article['tagColor']!)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      article['title']!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Description
                  Text(
                    article['description']!,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
