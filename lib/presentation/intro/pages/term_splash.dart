import 'dart:io';

import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashTerm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'Chính sách và bảo mật',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            )),
            const SizedBox(
              height: 30,
            ),
            _buildSectionCard(
              title: 'Chính sách và điều kiện',
              content:
                  '1. Khi mua gói VIP, bạn sẽ có quyền truy cập vào tất cả các khóa học video trong thời gian gói còn hiệu lực.\n\n'
                  '2. Gói VIP không thể chuyển nhượng, cho tặng hoặc hoàn tiền sau khi đã thanh toán.\n\n'
                  '3. Thời hạn của gói VIP sẽ được tính từ thời điểm thanh toán thành công.\n\n'
                  '4. Chúng tôi có quyền thay đổi nội dung khóa học mà không cần thông báo trước, nhưng sẽ luôn đảm bảo quyền lợi tốt nhất cho người dùng.\n\n'
                  '5. Người dùng cần tuân thủ các quy định về sử dụng nội dung, không chia sẻ tài khoản hoặc phát tán video trái phép.\n\n'
                  '6. Nếu phát hiện hành vi gian lận, tài khoản có thể bị khóa mà không hoàn tiền.\n\n'
                  '7. Việc sử dụng gói VIP đồng nghĩa với việc bạn đồng ý với tất cả các điều khoản trên.',
            ),
            SizedBox(height: 16),
            _buildSectionCard(
              title: 'Quyền lợi người dùng',
              content:
                  '1. Người dùng gói VIP có quyền truy cập không giới hạn vào tất cả các khóa học video trong thời gian gói còn hiệu lực.\n\n'
                  '2. Được cập nhật nội dung mới nhất mà không phải trả thêm phí.\n\n'
                  '3. Hỗ trợ ưu tiên từ đội ngũ chăm sóc khách hàng khi gặp vấn đề trong quá trình học.\n\n'
                  '4. Được tham gia các sự kiện, hội thảo trực tuyến độc quyền dành riêng cho thành viên VIP.\n\n'
                  '5. Không có quảng cáo làm gián đoạn quá trình học tập.\n\n'
                  '6. Có thể học mọi lúc, mọi nơi trên nhiều thiết bị khác nhau.\n\n'
                  '7. Quyền lợi có thể được điều chỉnh theo chính sách mới nhất nhưng sẽ luôn đảm bảo lợi ích tốt nhất cho người dùng.',
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // Căn phải cả hai nút
                children: [
                  TextButton(
                    onPressed: () {
                      // Thoát ứng dụng
                      if (Platform.isAndroid) {
                        SystemNavigator
                            .pop(); // Thoát về màn hình chính trên Android
                      } else if (Platform.isIOS) {
                        exit(0); // Thoát ứng dụng trên iOS
                      }
                    },
                    child: const Text('Không đồng ý',
                        style: TextStyle(color: Colors.red)),
                  ),
                  TextButton(
                    onPressed: () => Routes.navigateToPage(context, Home()),
                    child: const Text(
                      'Tôi đồng ý',
                      style: TextStyle(
                        color: Color(0xFF047099),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required String content}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(color: Colors.black, fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}
