import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/security_card.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/login.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Security'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50, top: 10),
        child: Column(
          children: [
            SecurityCard(),
            const SizedBox(
              height: 10,
            ),
            SecurityCard(),
            const SizedBox(
              height: 10,
            ),
            SecurityCard(),
            const SizedBox(
              height: 10,
            ),
            Button(text: "click", onPressed: () => Routes.navigateToPage(context, Success()), buttonSize: Size(300, 50),),
          ],
        ),
      ),
    );
  }
}
