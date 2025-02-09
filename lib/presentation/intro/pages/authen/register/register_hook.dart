import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/Servers/auth/register_api.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/ErrorDialog.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/success.dart';
import 'package:flutter/material.dart';

class RegisterController {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final BuildContext context;
  bool isLoading = false;
  String? errorMessage;

  RegisterController({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.context,
  });

  Future<void> register(VoidCallback onLoading, VoidCallback onDone) async {
    final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

    if (!emailRegex.hasMatch(emailController.text)) {
      _showErrorDialog("Email không hợp lệ!");
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showErrorDialog("Mật khẩu không khớp!");
      return;
    }

    onLoading();

    try {
      await RegisterApi(Api()).register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      );

      if (context.mounted) {
        Routes.navigateToPage(context, Success());
      }
    } catch (error) {
      _showErrorDialog('Tài khoản đã tồn tại, hãy thử lại');
    } finally {
      onDone();
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => ErrorDialog(
        message: message,
        onRetry: () => register(() {}, () {}),
      ),
    );
  }
}
