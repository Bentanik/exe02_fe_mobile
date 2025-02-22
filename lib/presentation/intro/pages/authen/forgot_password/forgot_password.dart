import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/input_field.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Quên mật khẩu"),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text('Hãy nhập mail của bạn để có thể đổi mật khẩu'),
              const SizedBox(
                height: 15,
              ),
              InputField(
                controller: _emailController,
                icon: FontAwesomeIcons.user,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 15,
              ),
              Button(
                  text: 'Đặt lại mật khẩu',
                  onPressed: () => Routes.navigateToPage(context, Success()),
                buttonSize: Size(double.infinity, 40),
                backgroundColor: Color(0xFF6BB7CD),
                textColor: Colors.white,
              ),
            ],
          ),
        ));
  }
}
