import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/blog_card.dart';
import 'package:exe02_fe_mobile/common/widget/feature_blog_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/blog_awareness_detail.dart';
import 'package:flutter/material.dart';

class BlogsAwareness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dữ liệu ảo (mock data)
    final List<Map<String, dynamic>> newsItems = [
      {
        'id': 1,
        'title': 'Cách Nhận Biết Trang Web Lừa Đảo (HieuPC)',
        'imageUrl': AppImages.blog1_bg,
        'createDate': '15h30 23/02/2025',
        'content': '''
Dạo gần đây, tình trạng lừa đảo xuất hiện càng nhiều, gây hậu quả nặng nề về tinh thần lẫn tài chính của nhiều người. 

Chính vì vậy, Hiếu PC cùng với nhóm Chống Lừa Đảo quyết định cho ra mắt chuỗi Series: “Nhận Biết Lừa Đảo” vào mỗi Chủ Nhật hàng tuần lúc 7 giờ tối tại kênh Youtube 7onez.

Ở phần 1, tụi mình sẽ hướng dẫn mọi người cách nhận biết trang web lừa đảo, trang web giả có nguy cơ đánh cắp tài sản và thông tin cá nhân thông qua các dấu hiệu như:
- Đường link
- Nội dung
- Thông báo trên website…
'''
      },
      {
        'id': 2,
        'title': '[Cảnh báo] Thận trọng với các hình thức lừa đảo giả mạo VNSC by Finhay (VNSC)',
        'imageUrl': AppImages.scam2,
        'createDate': '15h33 23/02/2025',
        'content': '''
18/03/2024

Kính gửi Quý khách hàng,

Hiện nay, chúng tôi đã ghi nhận một số trường hợp lừa đảo nhằm chiếm đoạt tài sản qua hình thức chuyển khoản vào số tài khoản VNSC có chủ tài khoản khác tên. 

Tất cả các hình thức này đều là giả mạo Công ty Cổ phần Chứng khoán Vina (VNSC).

Chúng tôi xin lưu ý tới Quý khách hàng một vài điểm như sau:
- VNSC không uỷ quyền cho bất kỳ cá nhân hay đơn vị nào đại diện cho VNSC.
- Chỉ có một cách thức chuyển tiền duy nhất trên tài khoản chứng khoán VNSC của mỗi khách hàng.
- Khách hàng chỉ chuyển khoản vào số tài khoản có tên “VNSC – [Tên khách hàng]”. Tuyệt đối không chuyển vào tài khoản VNSC nào khác.
'''
      },
      {
        'id': 3,
        'title': 'Một số biện pháp phòng tránh lừa đảo trên không gian mạng phổ biến hiện nay',
        'imageUrl': AppImages.scam3,
        'createDate': '15h35 23/02/2025',
        'content': '''
1️⃣ **Bảo vệ thông tin cá nhân:** Không công khai thông tin cá nhân như ngày sinh, số CMND, số tài khoản ngân hàng trên mạng xã hội để tránh bị khai thác.

2️⃣ **Kiểm tra và cập nhật bảo mật:** Luôn cập nhật tính năng bảo mật trên tài khoản ngân hàng, mạng xã hội. Không chia sẻ thông tin đăng nhập, OTP.

3️⃣ **Xác minh tin nhắn vay tiền:** Nếu nhận tin nhắn vay tiền qua mạng xã hội, hãy gọi điện xác minh trước khi chuyển tiền.

4️⃣ **Cẩn trọng khi kết bạn trên mạng:** Không kết bạn với người lạ hứa hẹn tặng tiền, tài sản lớn.

5️⃣ **Trình báo ngay khi nghi ngờ lừa đảo:** Nếu nhận cuộc gọi tự xưng công an hoặc cơ quan nhà nước đe dọa, hãy trình báo công an gần nhất.

6️⃣ **Cẩn trọng khi thực hiện giao dịch:** Không truy cập các đường link lạ, không cung cấp OTP hoặc thông tin tài khoản ngân hàng.

7️⃣ **Cảnh giác với lời mời kiếm tiền dễ dàng:** Không tin vào lời dụ dỗ làm việc nhẹ nhàng, kiếm tiền nhanh hoặc yêu cầu chuyển khoản trước.

8️⃣ **Cẩn trọng khi cài đặt ứng dụng:** Không cài đặt ứng dụng không rõ nguồn gốc. Khi phát hiện SIM bị vô hiệu hóa, liên hệ nhà mạng ngay lập tức.

9️⃣ **Quản lý tài khoản ngân hàng:** Không mở, cho thuê hoặc bán tài khoản ngân hàng. Nếu phát hiện hành vi này, hãy báo công an.

🔟 **Tránh truy cập website giả mạo:** Không truy cập vào các trang web không rõ ràng, giả mạo ngân hàng hoặc dịch vụ tài chính.
'''
      },
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Bài viết nhận thức'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured Blogs Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Các bài viết nổi bật',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newsItems.length,
                      itemBuilder: (context, index) {
                        final blog = newsItems[index];
                        return GestureDetector(
                          onTap: () {
                            Routes.navigateToPage(
                              context,
                              BlogAwarenessDetail(blogData: blog),
                            );
                          },
                          child: FeatureBlogCard(
                            title: blog['title'],
                            imageUrl: blog['imageUrl'],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Các bài viết mới nhất',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  ListView.builder(
                    itemCount: newsItems.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final blog = newsItems[index];
                      return BlogCard(
                        onPress: () {
                          // Điều hướng đến trang chi tiết với dữ liệu của blog
                          Routes.navigateToPage(
                            context,
                            BlogAwarenessDetail(blogData: blog),
                          );
                        },
                        title: blog['title'],
                        imageUrl: blog['imageUrl'],
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
