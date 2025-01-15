import 'package:exe02_fe_mobile/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationDialog extends StatelessWidget {
   final String title;
   final String desc;
   final String leading;
   final String text_btn;
   final Color btn_color;

  const NotificationDialog({Key? key, required this.title, required this.desc, required this.leading,required this.text_btn,required this.btn_color })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Biểu tượng sao và huy hiệu
            SvgPicture.asset(
              leading
            ),
            SizedBox(height: 16),
            // Tiêu đề
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8),

            Text(
              desc,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),

            // TextButton(
            //   onPressed: () {
            //
            //   },
            //   child: Text(
            //     "Watch the Course",
            //     style: TextStyle(color: Colors.blue),
            //   ),
            // ),
            SizedBox(height: 16),
            // Nút "Next Video"
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: btn_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(text_btn),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
