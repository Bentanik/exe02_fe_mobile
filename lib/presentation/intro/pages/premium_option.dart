import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/premium_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/payment_method.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class PremiumOption extends StatefulWidget {
  @override
  _PremiumOptionState createState() => _PremiumOptionState();
}

class _PremiumOptionState extends State<PremiumOption> {
  String? selectedPlan;
  bool isSelected = false;

  void selectPlan(String plan) {
    setState(() {
      selectedPlan = plan;
    });
  }

  void toggleSelection(String plan) {
    setState(() {
      selectedPlan =
          (selectedPlan == plan) ? null : plan; // Nếu chọn lại thì bỏ chọn
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image Section
            Container(
              height: 200,
              child: Stack(
                children: [
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset(
                        AppImages.premiumBg1,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Image.asset(
                        AppImages.premiumBg,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      // Add more images as needed
                    ],
                  ),
                ],
              ),
            ),
            // Phần header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trải nghiệm các khóa học chất lượng cùng chuyên gia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bạn có thể tham gia các khóa học sau khi nâng cấp lên gói premium.',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FeatureItem(
                          icon: Icons.video_label_outlined,
                          text: 'Xem video không quảng cáo',
                        ),
                        FeatureItem(
                          icon: Icons.play_arrow,
                          text: 'Phát video theo thứ tự bất kỳ',
                        ),
                        FeatureItem(
                          icon: Icons.high_quality,
                          text: 'Chất lượng video cao',
                        ),
                        FeatureItem(
                          icon: Icons.queue_play_next,
                          text: 'Sắp xếp danh sách video theo ý muốn',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  PremiumCard(
                    duration: 'Ưu đãi 1 tháng',
                    price: '500.000 vnd',
                    backgroundColor: Color(0xFF6BB7CD),
                    textColor: Color(0xFF6BB7CD),
                    isSelected: selectedPlan == '1 tháng',
                    onTap: () => toggleSelection('1 tháng'),
                  ),
                  const SizedBox(height: 10),
                  PremiumCard(
                    duration: 'Ưu đãi 3 tháng',
                    price: '1.000.000 vnd',
                    backgroundColor: Color(0xFF3794B3),
                    textColor: Color(0xFF3794B3),
                    isSelected: selectedPlan == '3 tháng',
                    onTap: () => toggleSelection('3 tháng'),
                  ),
                  const SizedBox(height: 10),
                  PremiumCard(
                    duration: 'Ưu đãi 6 tháng',
                    price: '1.300.000 vnd',
                    backgroundColor: Color(0xFF047099),
                    textColor: Color(0xFF047099),
                    isSelected: selectedPlan == '6 tháng',
                    onTap: () => toggleSelection('6 tháng'),
                  ),
                  const SizedBox(height: 16),
                  // Nút Thanh Toán
                  Center(
                    child: Button(
                      text: 'Thanh toán',
                      buttonSize: Size(double.infinity, 40),
                      backgroundColor: selectedPlan != null
                          ? Color(0xFF047099)
                          : Color(0xFF6BB7CD),
                      onPressed: selectedPlan != null
                          ? () async {
                              await Routes.navigateToPage(context, PaymentMethods());
                            }
                          : () async {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const FeatureItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 28),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
