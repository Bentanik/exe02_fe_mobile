import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/common/widget/input_field.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/launching.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
              // Title
              const Center(
                child: Text(
                  "Let's Get Started!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Create an account to get all features",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // First Name
              const InputField(
                icon: Icons.person_outline,
                hintText: 'First Name',
              ),
              const SizedBox(height: 15),

              // Last Name
              const InputField(
                icon: Icons.person_outline,
                hintText: 'Last Name',
              ),
              const SizedBox(height: 15),

              // User Name
              const InputField(
                icon: Icons.person_outline,
                hintText: 'User Name',
              ),
              const SizedBox(height: 15),

              // Email
              const InputField(
                icon: Icons.email_outlined,
                hintText: 'Email',
              ),
              const SizedBox(height: 15),

              // Password
              const InputField(
                icon: Icons.lock_outline,
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 15),

              // Confirm Password
              const InputField(
                icon: Icons.lock_outline,
                hintText: 'Confirm Password',
                isPassword: true,
              ),
              const SizedBox(height: 30),

              // Create Button
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Button(
                      text: 'Tạo tài khỏan',
                      onPressed: () => Routes.navigateToPage(context, Success()),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Login Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        // Xử lý sự kiện chuyển sang trang đăng nhập
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
