import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class BlogAwarenessDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image and Back Button
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),),
                      image: DecorationImage(
                        image: AssetImage(AppImages.bg), // Ảnh nền
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              // Author Info
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/150',
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'Samuel Newton',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Article Content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category
                    Text(
                      'TECHNOLOGY',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Title
                    Text(
                      'To build responsibly, tech needs to do more than just hire chief ethics officers',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(height: 8),
                    // Date
                    Text(
                      '17 June, 2023 — 4:49 PM',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Article Body
                    Text(
                      'In the last couple of years, we\'ve seen new teams in tech companies emergelakslk laksk akslk lakslk lkalskl kalk lkalvkalsk lakl kals kalk lak llask ạ knakl nmaokj nlkn klanl anlk nalkn lmkank adn klj lnkl iodlj nald nlajdnlkj nljn klanlk nlanv ad na lạ kan jdl jaj ja jajn ;n; nakn ;ja   aio ;oiah ouas ouaufn aljf oiafloj aupf oua á afb aufb iouabf la bouabsou',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}