import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/input_field.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/login/login_hook.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  final Function(bool, {String? avatarUrl}) updateLoginState;

  const Login({Key? key, required this.updateLoginState}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  late LoginController _loginController;


  @override
  void initState() {
    super.initState();
    _loginController = LoginController(
      emailController: _emailController,
      passwordController: _passwordController,
      context: context,
      updateLoginState: widget.updateLoginState,
    );
  }

  Future<void> _handleLogin() async {
    setState(() => _isLoading = true); // Bắt đầu loading

    await _loginController.login(
          () => setState(() => _isLoading = true),  // Khi login bắt đầu
          () {
        setState(() => _isLoading = false);
        String avatarUrl = "https://example.com/avatar.jpg";
        widget.updateLoginState(true, avatarUrl: avatarUrl);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 32),
                  Image.asset(AppImages.logo, width: 200),
                  const SizedBox(height: 16),
                  const Text(
                    "Welcome to antiSCM",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Log in to existing antiSCM account",
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
                    hintText: 'Password',
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      child: Button(
                        text: _isLoading ? 'Đang đăng nhập...' : 'Đăng nhập',
                        onPressed: _handleLogin,
                        buttonSize: const Size(350, 50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text("Or sign up using"),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.facebook),
                        color: Colors.blue,
                        iconSize: 32,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.google),
                        color: Colors.red,
                        iconSize: 32,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const FaIcon(FontAwesomeIcons.phone),
                        color: Colors.green,
                        iconSize: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
