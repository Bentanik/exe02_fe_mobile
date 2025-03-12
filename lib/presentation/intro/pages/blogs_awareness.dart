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
Dạo gần đây, tình trạng lừa đảo xuất hiện càng nhiều gây hậu quả nặng nề về tinh thần lẫn tài chính của nhiều người. Chính vì vậy, Hiếu PC cùng với nhóm Chống Lừa Đảo quyết định cho ra mắt chuỗi Series: “Nhận Biết Lừa Đảo” vào mỗi Chủ Nhật hàng tuần vào lúc 7 giờ tối tại kênh Youtube 7onez. Ở phần 1, tụi mình sẽ hướng dẫn mọi người cách nhận biết trang web lừa đảo, trang web giả có nguy cơ đánh cắp tài sản và thông tin cá nhân thông qua các dấu hiệu như: đường link, nội dung, thông báo trên website…

① Cách nhận biết trang web lừa đảo nhanh qua đường dẫn link độc hại:

Để nhận biết trang web lừa đảo, trước hết hãy kiểm tra kỹ địa chỉ trang web. Một số dấu hiệu thường gặp là lỗi chính tả trong tên miền như sai, thiếu, thừa ký tự hoặc thay thế bằng ký tự gần giống (ví dụ: shopeepv.com, fptshopvn.com), tên miền có tiền tố/hậu tố lạ hoặc sử dụng tên miền phụ bắt chước trang uy tín (shopee.sukientriankhachhang2021.com). Các tên miền sử dụng đuôi phổ biến như .com, .org, .gov, .edu thường đáng tin hơn, trong khi các đuôi ít phổ biến như .info, .asia, .vip, .tk, .xyz thường có độ tin cậy thấp. Ngoài ra, cần cảnh giác với tên miền mới đăng ký, tên miền có ký tự đặc biệt (ví dụ: fàcebook.com), các link rút gọn (bit.ly, cutt.ly, shorturl.at), hay các trường hợp tên miền phụ bị chiếm quyền (subdomain takeover). Một số trang còn cố tình tạo tên miền dài để đánh lừa người dùng hoặc sử dụng các nền tảng web miễn phí như Weebly, Google Sites, Wix để dựng trang giả mạo. Bên cạnh đó, kẻ xấu còn đầu tư fanpage (thậm chí có tích xanh), đổi tên gần giống thương hiệu nổi tiếng, rồi dùng tài khoản ảo để bình luận giả nhằm tăng độ tin cậy.

② Cách nhận biết trang web lừa đảo qua giao diện trang web

Mọi người hãy xem kỹ giao diện web. Cách nhận biết web lừa đảo này rất dễ nhận biết vì website thật thường giao diện rất chuyên nghiệp, tương thích cho cả điện thoại, laptop hay máy tính bảng. Hãy để ý các yếu tố như logo, hình nền và chắc chắn rằng chúng không phải là phiên bản nhái (sai khác về chi tiết, màu sắc) hay phiên bản lỗi thời (sử dụng hình ảnh phiên bản cũ). Một trang web sử dụng hình ảnh không đúng quy chuẩn thương hiệu chắc chắn là trang web không an toàn.


'''
      },
      {
        'id': 2,
        'title': '[Cảnh báo] Thận trọng với các hình thức lừa đảo giả mạo VNSC by Finhay (VNSC)',
        'imageUrl': AppImages.scam2,
        'createDate': '15h33 23/02/2025',
        'content': '''
Kính gửi Quý khách hàng,

Hiện nay, chúng tôi đã ghi nhận một số trường hợp lừa đảo nhằm chiếm đoạt tài sản qua hình thức chuyển khoản vào số tài khoản VNSC có chủ tài khoản khác tên. Tất cả các hình thức này đều là giả mạo Công ty Cổ phần Chứng khoán Vina (VNSC).

Chúng tôi xin lưu ý tới Quý khách hàng một vài điểm như sau:
• VNSC không uỷ quyền cho bất kỳ cá nhân hay đơn vị nào đại diện cho VNSC.
• Chỉ có 1 cách thức chuyển tiền duy nhất trên tài khoản chứng khoán VNSC của mỗi khách hàng, Quý khách hàng vui lòng chỉ thực hiện theo đúng hướng dẫn chuyển tiền được ghi trên chính tài khoản cá nhân của mình.
Ví dụ: Khách hàng Nguyễn Văn A sẽ chỉ chuyển khoản vào số tài khoản có tên “VNSC – Nguyễn Văn A”. Ngoài ra, tuyệt đối không chuyển khoản vào số tài khoản VNSC nào khác.

Ngoài ra, tất cả thông tin về sản phẩm, chương trình khuyến mãi, chúng tôi đều cập nhật trên các kênh truyền thông chính thức:
• Trang website thông tin chính thức và duy nhất của VNSC: https://www.vnsc.vn/
• Trang web trading chính thức và duy nhất: https://invest.vnsc.vn/
• Trang fanpage chính thức: https://www.facebook.com/vnscbyfinhay
• Group cộng đồng VNSC by Finhay với hơn 200k thành viên: https://www.facebook.com/groups/238021257145972

❗Nếu có bất kỳ thông tin nào cần giải đáp, Quý khách hàng vui lòng gọi ngay tới hotline 024 7777 8996 để được hỗ trợ kịp thời.
'''
      },
      {
        'id': 3,
        'title': 'Một số biện pháp phòng tránh lừa đảo trên không gian mạng phổ biến hiện nay',
        'imageUrl': AppImages.scam3,
        'createDate': '15h35 23/02/2025',
        'content': '''
① Bảo vệ thông tin cá nhân: Không công khai thông tin cá nhân như ngày sinh, số CMND, số tài khoản ngân hàng trên mạng xã hội để tránh bị khai thác.

② Kiểm tra và cập nhật bảo mật: Luôn cập nhật tính năng bảo mật trên tài khoản ngân hàng, mạng xã hội. Không chia sẻ thông tin đăng nhập, OTP.

③ Xác minh tin nhắn vay tiền: Nếu nhận tin nhắn vay tiền qua mạng xã hội, hãy gọi điện xác minh trước khi chuyển tiền.

④ Cẩn trọng khi kết bạn trên mạng: Không kết bạn với người lạ hứa hẹn tặng tiền, tài sản lớn.

⑤ Trình báo ngay khi nghi ngờ lừa đảo: Nếu nhận cuộc gọi tự xưng công an hoặc cơ quan nhà nước đe dọa, hãy trình báo công an gần nhất.

⑥ Cẩn trọng khi thực hiện giao dịch: Không truy cập các đường link lạ, không cung cấp OTP hoặc thông tin tài khoản ngân hàng.

⑦ Cảnh giác với lời mời kiếm tiền dễ dàng: Không tin vào lời dụ dỗ làm việc nhẹ nhàng, kiếm tiền nhanh hoặc yêu cầu chuyển khoản trước.

⑧ Cẩn trọng khi cài đặt ứng dụng: Không cài đặt ứng dụng không rõ nguồn gốc. Khi phát hiện SIM bị vô hiệu hóa, liên hệ nhà mạng ngay lập tức.

⑨ Quản lý tài khoản ngân hàng: Không mở, cho thuê hoặc bán tài khoản ngân hàng. Nếu phát hiện hành vi này, hãy báo công an.

⑩ Tránh truy cập website giả mạo: Không truy cập vào các trang web không rõ ràng, giả mạo ngân hàng hoặc dịch vụ tài chính.
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
