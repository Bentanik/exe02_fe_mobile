import 'package:flutter/material.dart';

class Success extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Success'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/bg_success.png'), // Ảnh nền
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/check_icon.png', width: 100),
                SizedBox(height: 20),
                Text(
                  'SUCCESSFUL',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
