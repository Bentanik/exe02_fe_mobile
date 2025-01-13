import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/drop_down.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Button(
            text: 'Nhấn vào đây',
            onPressed: () {
              print('Đã nhấn nút');
            },
          ),
          DropDown(),
        ],
      ),
    );
  }
}
