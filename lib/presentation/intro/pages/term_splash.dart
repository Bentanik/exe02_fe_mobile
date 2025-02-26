import 'dart:io';

import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
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
                fontWeight: FontWeight.w400,
              ),
            )),
            const SizedBox(
              height: 30,
            ),
            _buildSectionCard(
              title: 'Chính sách và điều kiện',
              content:
                  'Khi mua gói VIP, bạn sẽ có quyền truy cập vào tất cả các khóa học video trong thời gian gói còn hiệu lực.\n\n'
                  'Gói VIP không thể chuyển nhượng, cho tặng hoặc hoàn tiền sau khi đã thanh toán.\n\n'
                  'Thời hạn của gói VIP sẽ được tính từ thời điểm thanh toán thành công.\n\n'
                  'Chúng tôi có quyền thay đổi nội dung khóa học mà không cần thông báo trước, nhưng sẽ luôn đảm bảo quyền lợi tốt nhất cho người dùng.\n\n'
                  'Người dùng cần tuân thủ các quy định về sử dụng nội dung, không chia sẻ tài khoản hoặc phát tán video trái phép.\n\n'
                  'Nếu phát hiện hành vi gian lận, tài khoản có thể bị khóa mà không hoàn tiền.\n\n'
                  'Việc sử dụng gói VIP đồng nghĩa với việc bạn đồng ý với tất cả các điều khoản trên.',
            ),
            SizedBox(height: 16),
            _buildSectionCard(
              title: 'Quyền lợi người dùng',
              content:
                  'Người dùng gói VIP có quyền truy cập không giới hạn vào tất cả các khóa học video trong thời gian gói còn hiệu lực.\n\n'
                  'Được cập nhật nội dung mới nhất mà không phải trả thêm phí.\n\n'
                  'Hỗ trợ ưu tiên từ đội ngũ chăm sóc khách hàng khi gặp vấn đề trong quá trình học.\n\n'
                  'Được tham gia các sự kiện, hội thảo trực tuyến độc quyền dành riêng cho thành viên VIP.\n\n'
                  'Không có quảng cáo làm gián đoạn quá trình học tập.\n\n'
                  'Có thể học mọi lúc, mọi nơi trên nhiều thiết bị khác nhau.\n\n'
                  'Quyền lợi có thể được điều chỉnh theo chính sách mới nhất nhưng sẽ luôn đảm bảo lợi ích tốt nhất cho người dùng.',
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn phải cả hai nút
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF047099)),
                    ),
                    child: const Text(
                      'Không đồng ý',
                      style: TextStyle(color: Color(0xFF047099)),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Button(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Color(0xFF047099),
                            ),
                          );
                        },
                      );
                      Navigator.pop(context); // Đóng dialog
                      Routes.navigateToPage(context, Home()); // Chuyển đến Home()
                    },
                    text: 'Tôi đồng ý',
                    backgroundColor: Color(0xFF047099),
                    buttonSize: Size(150, 40),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 20,
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
