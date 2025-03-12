import 'package:exe02_fe_mobile/Servers/auth/auth_service.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/input_field.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/forgot_password/forgot_password.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/register/register.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Đăng nhập',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  Image.asset(AppImages.logo, width: 200),
                  const SizedBox(height: 16),
                  const Text(
                    "Chào mừng đến với antiSCM",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Đăng nhập vào tài khoản của bạn",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 32),
                  InputField(
                    controller: _emailController,
                    icon: FontAwesomeIcons.user,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    controller: _passwordController,
                    icon: FontAwesomeIcons.lock,
                    hintText: 'Mật khẩu',
                    isPassword: true,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          Routes.navigateToPage(context, ForgotPassword()),
                      child: const Text(
                        "Quên mật khẩu ?",
                        style: TextStyle(color: Color(0xFF6BB7CD)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Center(
                  //   child: SizedBox(
                  //     child: Button(
                  //       text: _isLoading ? 'Đang đăng nhập...' : 'Đăng nhập',
                  //       onPressed: _handleLogin,
                  //       buttonSize: const Size(350, 50),
                  //     ),
                  //   ),
                  // ),
                  Button(
                    text: 'Đăng nhập',
                    onPressed: () async {
                      AuthService().signIn(
                        context: context,
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                    },
                    backgroundColor: Color(0xFF047099),
                    buttonSize: Size(double.infinity, 40),
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Giúp nội dung không chiếm toàn bộ chiều rộng
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Bạn chưa có tài khoản? ',
                          style: TextStyle(color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () => Routes.navigateToPage(context, Register()),
                          child: const Text(
                            'Đăng ký ngay.',
                            style: TextStyle(
                              color: Color(0xFF6BB7CD),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
