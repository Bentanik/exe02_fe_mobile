import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/Servers/auth/register_api.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/ErrorDialog.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/input_field.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _register() async {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!emailRegex.hasMatch(_emailController.text)) {
      setState(() => _errorMessage = "Email không hợp lệ!");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorDialog("Email không hợp lệ!");
      });
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() => _errorMessage = "Mật khẩu không khớp!");
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorDialog("Mật khẩu không khớp!");
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await RegisterApi(Api()).register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (mounted) {
        Routes.navigateToPage(context, Success());
      }
    } catch (error) {
      setState(() => _errorMessage = error.toString());

      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showErrorDialog('Tài khoản đã tồn tại, hãy thử lại');
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        message: message,
        onRetry: _register,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Let's Get Started!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Create an account to get all features",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),

              InputField(
                controller: _nameController,
                icon: Icons.person_outline,
                hintText: 'Họ và Tên',
              ),
              const SizedBox(height: 15),

              InputField(
                controller: _emailController,
                icon: Icons.email_outlined,
                hintText: 'Email',
              ),
              const SizedBox(height: 15),

              InputField(
                controller: _passwordController,
                icon: Icons.lock_outline,
                hintText: 'Mật khẩu',
                isPassword: true,
              ),
              const SizedBox(height: 15),

              InputField(
                controller: _confirmPasswordController,
                icon: Icons.lock_outline,
                hintText: 'Xác nhận mật khẩu',
                isPassword: true,
              ),
              const SizedBox(height: 15),
              Center(
                child: SizedBox(
                  child: Button(
                    text: _isLoading ? 'Đang đăng ký...' : 'Tạo tài khoản',
                    onPressed: _register,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        // Chuyển sang trang đăng nhập
                      },
                      child: const Text(
                        "Login here",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
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
