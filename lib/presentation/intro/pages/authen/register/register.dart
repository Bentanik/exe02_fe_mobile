import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/ErrorDialog.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/input_field.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/register/register_hook.dart';
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

  late RegisterController _registerController;

  @override
  void initState() {
    super.initState();
    _registerController = RegisterController(
      nameController: _nameController,
      emailController: _emailController,
      passwordController: _passwordController,
      confirmPasswordController: _confirmPasswordController,
      context: context,
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
                    onPressed: () => _registerController.register(
                            () => setState(() => _isLoading = true),
                            () => setState(() => _isLoading = false),
                      ),
                    buttonSize: Size(350, 50),
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
