import 'package:exe02_fe_mobile/common/widget/premium_card.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class PremiumOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
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
                        AppImages.bg,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Image.asset(
                        AppImages.chatBot,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      // Add more images as needed
                    ],
                  ),
                ],
              ),
            ),

            // Premium Text Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trải nghiệm âm nhạc đỉnh cao với gói Premium Individual.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bạn không thể nâng cấp lên Premium trong ứng dụng này. Chúng tôi biết điều này thật bất tiện.',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            // Features Section
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FeatureItem(
                    icon: Icons.music_note,
                    text: 'Nghe nhạc không quảng cáo',
                  ),
                  FeatureItem(
                    icon: Icons.download,
                    text: 'Tải xuống để nghe không cần mạng',
                  ),
                  FeatureItem(
                    icon: Icons.play_arrow,
                    text: 'Phát nhạc theo thứ tự bất kỳ',
                  ),
                  FeatureItem(
                    icon: Icons.high_quality,
                    text: 'Chất lượng âm thanh cao',
                  ),
                  FeatureItem(
                    icon: Icons.people,
                    text: 'Nghe cùng bạn bè theo thời gian thực',
                  ),
                  FeatureItem(
                    icon: Icons.queue_music,
                    text: 'Sắp xếp danh sách chờ nghe',
                  ),
                ],
              ),
            ),
            PremiumCard(),
            const SizedBox(height: 10,),
            PremiumCard(),
            const SizedBox(height: 10,),
            PremiumCard(),
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
