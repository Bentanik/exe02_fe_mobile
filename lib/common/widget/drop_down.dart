import 'package:exe02_fe_mobile/core/configs/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  const DropDown() : super();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.red,
          width: 240,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Edit profile',
                style: TextStyle(
                  color: Colors.white,

                )
              )
            ],
          ),
        ),
      ],
    );
  }
}
