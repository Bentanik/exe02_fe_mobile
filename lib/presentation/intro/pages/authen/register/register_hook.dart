import 'package:dio/dio.dart';
import 'package:exe02_fe_mobile/Servers/api.dart';
import 'package:exe02_fe_mobile/Servers/auth/register_api.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/common/widget/ErrorDialog.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/authen/login/login.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        // Hiển thị thông báo thành công
        Fluttertoast.showToast(
          msg: "Đăng kí thành công!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        Future.delayed(Duration(seconds: 1), () {
          Routes.navigateToPage(context, Login());
        });
      }
    } catch (error) {
      String? errorMessage;

      if (error is DioException) {
        final responseData = error.response?.data;

        if (responseData is Map<String, dynamic>) {
          if (responseData.containsKey('errors') &&
              responseData['errors'] is List &&
              responseData['errors'].isNotEmpty) {
            errorMessage = responseData['errors'][0]['message'];
          } else if (responseData.containsKey('detail')) {
            errorMessage = responseData['detail'];
          }
        }
      }
      _showErrorDialog(errorMessage ?? 'Có lỗi xảy ra, hãy thử lại');
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
